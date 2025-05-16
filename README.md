# Wi6CSI
Wi6CSI: A Human Activity Recognition Dataset for Next-Generation WiFi Sensing in the 6 GHz Band

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

👉 **[WiFi 6GHz Dataset on Hugging Face](https://huggingface.co/datasets/kentridgeai/Wi6CSI)**

### Dataset Contents

- **.mp4 files:**  
  These files are Pose3D videos that capture 3D representations of subjects during data collection. They can be used for visual analysis, activity recognition, or correlating motion with CSI data.

- **.mat files:**  
  These MATLAB files contain the Wi-Fi CSI values. The numerical data stored in these files represent the channel state information of the wireless signal, useful for signal processing or machine learning applications.

- **.csi files:**  
  These files hold raw Wi-Fi CSI data. They are not immediately usable and must be parsed using the [picoscenes toolbox](https://ps.zpj.io/matlab.html) to extract the relevant features for analysis.

### Single User Activity Recognition Structure
| **Activity**                    |
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

| **Location**                    |
|---------------------------------|
| Room (L1)                       |
| Extended Room (L2)              |
| Meeting Room (L3)               |

| **Trial Number**                |
|---------------------------------|
| Trial 1 (T1)                    |
| Trial 2 (T2)                    |
| Trial 3 (T3)                    |
| Trial 4 (T4)                    |

| **Participant Number**          |
|---------------------------------|
| Participant 1 (P1)              |
| Participant 2 (P2)              | 
| Participant 3 (P3)              |
| Participant 4 (P4)              |
| Participant 5 (P5)              |

### Multi User Interaction Structure
| **Scenario No.** | **Participant P1**     | **Participant P2**     | **Participant P3**       |
|------------------|------------------------|------------------------|--------------------------|
| S1               | (A5) Clap              | (A6) Wave              | (A7) Arm Circles         |
| S2               | (A10) Bicep Curls      | (A2) Standing Still    | (A6) Wave                |
| S3               | (A3) Sitting Still     | (A10) Bicep Curls      | (A6) Wave                |
|------------------|------------------------|------------------------|--------------------------|
| S4               | (A13) Jump             | (A12) Walk (Parallel)  | (A5) Clap                |
| S5               | (A10) Bicep Curls      | (A9) Squats            | (A12) Walk (Parallel)    |
| S6               | (A9) Squats            | (A6) Wave              | (A2) Standing Still      |
|------------------|------------------------|------------------------|--------------------------|
| S7               | (A14) High Five        | (A14) High Five        | (A6) Wave                |
| S8               | (A15) Passing Object   | (A15) Passing Object   | (A12) Walk (Parallel)    |
| S9               | (A16) Handshake        | (A16) Handshake        | (A5) Clap                |

| **Location**                    |
|---------------------------------|
| Meeting Room (L3)               |

| **Trial Number**                |
|---------------------------------|
| Trial 1 (T1)                    |
| Trial 2 (T2)                    |
| Trial 3 (T3)                    |
| Trial 4 (T4)                    |

| **Participant Number**          |
|---------------------------------|
| Participant 1 (P1)              |
| Participant 2 (P2)              | 
| Participant 3 (P3)              |

### People Counting Structure
| **Scenario No.** | **Details**                                                     |
|------------------|-----------------------------------------------------------------|
| S10              | Sitting relatively still while using a mobile phone and talking |
| S11              | Standing and mingling with other participants                   |

| **Location**                    |
|---------------------------------|
| Meeting Room (L3)               |

| **Trial Number**                |
|---------------------------------|
| Trial 1 (T1)                    |
| Trial 2 (T2)                    |
| Trial 3 (T3)                    |
| Trial 4 (T4)                    |

| **Number of Participants** | **Participant Numbers** |
|----------------------------|-------------------------|
| 1 (N1)                     | P1                      |
| 2 (N2)                     | P1, P2                  |
| 3 (N3)                     | P1, P2, P3              |
| 4 (N4)                     | P1, P2, P3, P4          |
| 5 (N5)                     | P1, P2, P3, P4, P5      |
