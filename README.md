# Wi6CSI
Exploring WiFi 6GHz for CSI-Based Sensing: A New Dataset for Indoor Activity Recognition

## Wi6CSI Dataset Overview

**Wi6CSI** is a comprehensive Wi-Fi sensing dataset collected in the **6GHz** band. It offers a rich, high-resolution resource for researchers

### Key Features

- **Scenarios Covered:**
  - **Single User:** Data captured with one user performing various activities.
  - **Multi User:** Data where multiple users are present simultaneously.
  - **People Counting:** Scenarios designed to count individuals within a specific area.

- **Collection Locations:**  
  Data has been collected across **three distinct locations**, ensuring diverse environmental conditions and variations in the wireless channel.

- **Data Volume and Resolution:**  
  - The dataset holds approximately **1.5TB** of data.
  - Each Wi-Fi packet includes **8100 subcarriers**, offering a level of detail that supports high-resolution sensing and analysis.

- **Wi-Fi Band:**  
  - Utilizes the **6GHz** frequency band, providing enhanced granularity and improved sensing accuracy compared to lower frequency bands.

## Wi6CSI Sample Dataset

This repository contains a sample subset of the complete Wi6CSI dataset containing just a few single user activities. The sample is provided to demonstrate the dataset structure and typical processing steps for research in Wi-Fi Channel State Information (CSI) analysis.
If you are interested in obtaining access to the complete Wi6CSI dataset or have any questions, please contact: [e0426004@u.nus.edu](mailto:e0426004@u.nus.edu)

👉 **[WiFi 6GHz Dataset Sample on Hugging Face](https://huggingface.co/datasets/WIFI6GHZDATASET/WiFi_6GHz_Dataset)**

### Dataset Contents

- **.mp4 files:**  
  These files are Pose3D videos that capture 3D representations of subjects during data collection. They can be used for visual analysis, activity recognition, or correlating motion with CSI data.

- **.mat files:**  
  These MATLAB files contain the Wi-Fi CSI values. The numerical data stored in these files represent the channel state information of the wireless signal, useful for signal processing or machine learning applications.

- **.csi files:**  
  These files hold raw Wi-Fi CSI data. They are not immediately usable and must be parsed using the [picoscenes toolbox](https://ps.zpj.io/matlab.html) to extract the relevant features for analysis.

### Single User Activity Recognition Structure
| Activity                        |
|---------------------------------|
| Empty Room (A1)                 |
| Standing Still (A2)             |
| Sitting Still (A3)              |
| Lying Down Still (A4)           |
| Clap (A5)                       |
| Wave (A6)                       |
| Arm Circles (A7)                |
| Bicep Curls (A10)               |
| Toe Touches (A8)                |
| Squats (A9)                     |
| Walk (Perpendicular) (A11)      |
| Walk (Parallel) (A12)           |
| Jump (A13)                      |

| Location                        |
|---------------------------------|
| Room (L1)                       |
| Extended Room (L2)              |
| Meeting Room (L3)               |

| Trial Number                    |
|---------------------------------|
| Trial 1 (T1)                    |
| Trial 2 (T2)                    |
| Trial 3 (T3)                    |
| Trial 4 (T4)                    |
| Trial 5 (T5)                    |

| Participant Number              |
|---------------------------------|
| Participant 1 (P1)              |
| Participant 2 (P2)              | 
| Participant 3 (P3)              |
| Participant 4 (P4)              |
| Participant 5 (P5)              |
