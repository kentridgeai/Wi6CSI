%% Required Toolboxes
% This script requires the following MATLAB toolboxes:
% - Signal Processing Toolbox
% - Wavelet Toolbox

clc; clear; close all;

%% Constants
fs = 800;
fc_high = 2;
fc_low = 40;
[b_high, a_high] = butter(4, fc_high / (fs / 2), 'high');
[b_low, a_low] = butter(4, fc_low / (fs / 2), 'low');
windowLength = 101;
polyOrder = 3;
keep_start = 501;
keep_end = 11000;

%% Load all the .mat files in folder
files = dir('*.mat');

for fileIdx = 1:length(files)
    file_name = files(fileIdx).name;
    fprintf('\nProcessing file: %s\n', file_name);

    try
        data = load(file_name);
        csi_data = data.data.CSI.CSI;

        % Extract subcarrier groups
        csi_data_1 = csi_data(:, 1:2025);
        csi_data_3 = csi_data(:, 4051:6075);
        csi_conj = csi_data_3 .* conj(csi_data_1);

        % Amplitude & Phase
        amp = abs(csi_conj);
        phase = unwrap(angle(csi_conj));

        % Filters + smoothing
        amp = sgolayfilt(filtfilt(b_low, a_low, filtfilt(b_high, a_high, amp)), polyOrder, windowLength);
        phase = sgolayfilt(filtfilt(b_low, a_low, filtfilt(b_high, a_high, phase)), polyOrder, windowLength);

        %% Subcarrier Score Calculation
        k = 10;
        alpha = 0.3;
        num_subcarriers = size(amp, 2);

        score_amp = zeros(1, num_subcarriers);
        score_phase = zeros(1, num_subcarriers);

        var_amp = var(amp, 0, 1);
        norm_var_amp = (var_amp - min(var_amp)) / (max(var_amp) - min(var_amp));
        for sc = 1:num_subcarriers
            neighbors = max(1, sc - floor(k/2)) : min(num_subcarriers, sc + floor(k/2));
            cov_vals = arrayfun(@(n) cov(amp(:, sc), amp(:, n)), neighbors, 'UniformOutput', false);
            cov_vals = cellfun(@(c) c(1,2), cov_vals);
            score_amp(sc) = mean(cov_vals) * norm_var_amp(sc)^alpha;
        end

        var_phase = var(phase, 0, 1);
        norm_var_phase = (var_phase - min(var_phase)) / (max(var_phase) - min(var_phase));
        for sc = 1:num_subcarriers
            neighbors = max(1, sc - floor(k/2)) : min(num_subcarriers, sc + floor(k/2));
            cov_vals = arrayfun(@(n) cov(phase(:, sc), phase(:, n)), neighbors, 'UniformOutput', false);
            cov_vals = cellfun(@(c) c(1,2), cov_vals);
            score_phase(sc) = mean(cov_vals) * norm_var_phase(sc)^alpha;
        end

        % Top subcarrier selection
        [~, top_amp_idx] = maxk(score_amp, 2025);
        [~, top_phase_idx] = maxk(score_phase, 2025);

        selected_amp = amp(:, top_amp_idx(10:510));
        selected_phase = phase(:, top_phase_idx(10:510));

        % Mean across selected subcarriers
        mean_amp = mean(selected_amp, 2);
        mean_phase = mean(selected_phase, 2);

        %% Clip signal range
        if keep_end > length(mean_amp)
            warning('Signal too short in %s, skipping.', file_name);
            continue;
        end
        mean_amp = mean_amp(keep_start:keep_end);
        mean_phase = mean_phase(keep_start:keep_end);

        %% CWT
        [wt_amp, freq_amp] = cwt(mean_amp, 'morse', fs);
        [wt_phase, freq_phase] = cwt(mean_phase, 'morse', fs);
        time_axis = linspace(0, length(mean_amp)/fs, size(wt_amp, 2));

        % Truncate to ≤ 45Hz 
        freq_limit = 45;
        freq_mask_amp = freq_amp <= freq_limit;
        freq_amp = freq_amp(freq_mask_amp);
        wt_amp = abs(wt_amp(freq_mask_amp, :));

        freq_mask_phase = freq_phase <= freq_limit;
        freq_phase = freq_phase(freq_mask_phase);
        wt_phase = abs(wt_phase(freq_mask_phase, :));

        %% Save with dynamic prefix
        if contains(file_name, 'T4')
            prefix = 'test';
        else
            prefix = 'train';
        end
        [~, base_name, ~] = fileparts(file_name);
        amp_filename = sprintf('%samp_%s_cwt.mat', prefix, base_name);
        phase_filename = sprintf('%sphase_%s_cwt.mat', prefix, base_name);

        save(amp_filename, 'wt_amp', 'freq_amp', 'time_axis');
        save(phase_filename, 'wt_phase', 'freq_phase', 'time_axis');

        fprintf('✅ Saved: %s and %s\n', amp_filename, phase_filename);

    catch ME
        warning('❌ Failed to process %s: %s', file_name, ME.message);
    end
end

