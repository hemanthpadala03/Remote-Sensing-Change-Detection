# 🛰️ Remote Sensing Change Detection Using Deep Learning

<div align="center">
  <img src="https://img.shields.io/badge/Python-3.8+-blue.svg" alt="Python Version">
  <img src="https://img.shields.io/badge/TensorFlow-2.x-orange.svg" alt="TensorFlow">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/github/stars/hemanthpadala03/Remote-Sensing-Change-Detection?style=social" alt="Stars">
</div>

## 📖 Overview

This repository implements state-of-the-art deep learning architectures for **satellite/aerial image change detection**. The project focuses on developing robust models that can accurately identify temporal changes between two co-registered remote sensing images, with applications in urban monitoring, disaster assessment, and environmental studies.

### 🎯 Key Features

- **🌟 U-Net with ASPP (Atrous Spatial Pyramid Pooling)** - Primary model achieving **96.49% PCC**
- **SURF-based Dataset Preparation** for image matching and alignment
- **Multiple Model Implementations** for comprehensive comparison
- **Pre-trained Models** ready for inference
- **Traditional vs Deep Learning** comparison across multiple datasets
- **Comprehensive Performance Analysis** with detailed benchmarking

## 🏗️ U-Net ASPP Architecture Overview

Our **primary model** is a **U-Net with ASPP (Atrous Spatial Pyramid Pooling)** that incorporates:

- ✅ **ASPP Module** for multi-scale context understanding at different dilation rates
- ✅ **Attention Gates** for better feature focusing and reduced noise
- ✅ **Enhanced Skip Connections** with feature fusion mechanisms
- ✅ **Binary Change Map Output** for precise change localization
- ✅ **Bottleneck Design** with dilated convolutions for larger receptive fields

## 📂 Repository Structure

```
📦 Remote-Sensing-Change-Detection
├── 📁 Images/                  # Input satellite/aerial images
│   ├── Architecture.png
│   ├── Ground truth.png
│   ├── Image 1.png            # Before image
│   ├── Image 2.png            # After image
│   ├── Image Matching.png     # SURF feature matching visualization
│   └── Unet output.png
├── 📁 DATASET/
├── 📁 SURF(feature matching)/  # SURF-based image alignment & preprocessing
├── 📄 ALL_Models.ipynb         # Comprehensive model comparison
├── 📄 CNN_SVM_Transformer.ipynb  # Hybrid CNN-SVM + Transformer experiments
├── 📄 Custom_Advanced_Unet.ipynb # 🌟 U-Net ASPP main implementation
├── 📄 Vanilla_Unet.ipynb      # Baseline U-Net model
├── 📄 unet_model.h5           # Pre-trained U-Net ASPP model weights
└── 📄 README.md
```

## 🖼️ Visual Results

### Dataset Preparation with SURF Feature Matching

<div align="center">
  <img src="https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection/blob/main/Images/Image%20Matching.png" alt="SURF Feature Matching" width="800">
  <p><i>SURF-based feature matching for image alignment and dataset preparation</i></p>
</div>

### Input Images and Change Detection Results

| Before (Image 1) | After (Image 2) | Ground Truth | U-Net ASPP Output |
|:----------------:|:---------------:|:------------:|:----------------:|
| ![Input 1](https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection/blob/main/Images/Image%201.png) | ![Input 2](https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection/blob/main/Images/Image%202.png) | ![GT](https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection/blob/main/Images/Ground%20truth.png) | ![Output](https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection/blob/main/Images/Unet%20output.png) |

### U-Net ASPP Architecture

<div align="center">
  <img src="https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection/blob/main/Images/Architecture.png" alt="U-Net ASPP Architecture" width="800">
  <p><i>U-Net Architecture with ASPP (Atrous Spatial Pyramid Pooling) and Attention Gates</i></p>
</div>

## 🚀 Quick Start

### Prerequisites

```bash
pip install tensorflow keras numpy opencv-python scikit-learn matplotlib
```

### Usage

1. **Clone the repository:**
```bash
git clone https://github.com/hemanthpadala03/Remote-Sensing-Change-Detection.git
cd Remote-Sensing-Change-Detection
```

2. **Dataset Preparation with SURF:**
```python
# SURF-based feature matching for image alignment
import cv2
sift = cv2.SIFT_create()
# Feature matching and geometric transformation for co-registration
```

3. **Run the main U-Net ASPP model:**
```python
# Load the pre-trained U-Net ASPP model
from tensorflow.keras.models import load_model
model = load_model('unet_model.h5')

# Inference on new image pairs
change_map = model.predict([image1, image2])
```

## 📊 Model Performance - Comprehensive Benchmarking

### Performance Metrics Across Multiple Datasets

| Dataset | Model | PCC (%) | PFA (%) | PTE (%) |
|---------|-------|---------|---------|---------|
| **SET 1** | **U-Net ASPP (Proposed)** | **96.42** | **0.67** | **3.58** |
| SET 1 | Siamese U-Net | 94.11 | 4.40 | 5.89 |
| SET 1 | Siamese CNN | 95.13 | 2.31 | 3.87 |
| SET 1 | U-Net | 88.64 | 20.34 | 11.16 |
| SET 1 | CNN | 88.69 | 11.27 | 11.31 |
| SET 1 | SVM | 83.05 | 16.00 | 16.95 |
| SET 1 | RF | 76.35 | 24.00 | 23.65 |
| | | | | |
| **SET 3** | **U-Net ASPP (Proposed)** | **96.49** | **0.17** | **3.50** |
| SET 3 | Siamese U-Net | 94.54 | 2.89 | 5.46 |
| SET 3 | Siamese CNN | 93.69 | 1.70 | 4.31 |
| SET 3 | U-Net | 92.56 | 20.68 | 7.44 |
| SET 3 | CNN | 90.27 | 9.40 | 9.40 |
| SET 3 | SVM | 83.13 | 19.00 | 16.87 |
| SET 3 | RF | 87.41 | 13.00 | 12.59 |
| | | | | |
| **SET 5** | **U-Net ASPP (Proposed)** | **95.46** | **12.54** | **4.54** |
| SET 5 | U-Net | 94.46 | 18.57 | 6.92 |
| SET 5 | SVM | 85.04 | 14.00 | 14.96 |
| SET 5 | CNN | 84.60 | 15.79 | 15.40 |
| SET 5 | RF | 83.31 | 16.00 | 16.69 |
| SET 5 | Siamese CNN | 65.87 | 35.08 | 34.13 |
| SET 5 | Siamese U-Net | 59.39 | 41.80 | 40.61 |

**Legend:**
- **PCC:** Percentage of Correctly Classified pixels
- **PFA:** Percentage of False Alarms  
- **PTE:** Percentage of Total Error

*Our U-Net ASPP model consistently achieves the highest accuracy across all test datasets with minimal false alarms.*

## 🔬 Methodology

### 1. Dataset Preparation with SURF
- **SURF Feature Detection** for robust keypoint identification
- **Feature Matching** using FLANN-based matcher
- **Geometric Transformation** for precise image co-registration
- **Alignment Verification** ensuring pixel-level correspondence

### 2. U-Net ASPP Architecture
- **Encoder:** Feature extraction with downsampling + ASPP bottleneck
- **ASPP Module:** Multi-scale context aggregation with dilation rates [6, 12, 18]
- **Decoder:** Upsampling with skip connections and attention gates
- **Output:** Binary change probability map with sigmoid activation

### 3. Training Strategy
```python
# Loss function combining Binary Cross-Entropy and Dice Loss
loss = binary_crossentropy + dice_coefficient_loss
optimizer = Adam(learning_rate=1e-4)
```

## 📈 Applications

- 🏙️ **Urban Development Monitoring** - Track construction and infrastructure changes
- 🌿 **Environmental Assessment** - Monitor deforestation, land cover changes
- 🚨 **Disaster Impact Analysis** - Assess damage from natural disasters
- 🛣️ **Infrastructure Development** - Monitor road networks and building construction
- 🌍 **Climate Change Studies** - Analyze long-term environmental variations

## 🔧 Technical Details

### U-Net ASPP Specifications
- **Input:** Two co-registered RGB images (256×256×3)
- **Output:** Binary change map (256×256×1)  
- **Architecture:** U-Net with ASPP bottleneck and attention mechanisms
- **ASPP Dilation Rates:** [6, 12, 18] + Global Average Pooling
- **Training:** Adam optimizer, learning rate 1e-4, batch size 16
- **Performance:** Up to **96.49% accuracy** with **0.17% false alarms**

### Technologies Used
- ![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
- ![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat&logo=tensorflow&logoColor=white)
- ![OpenCV](https://img.shields.io/badge/OpenCV-27338e?style=flat&logo=opencv&logoColor=white)
- ![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat&logo=numpy&logoColor=white)
- ![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat&logo=scikit-learn&logoColor=white)

## 📊 Future Enhancements

- [ ] **Improved ASPP Design** with adaptive dilation rates
- [ ] **Vision Transformer Integration** for better long-range dependencies
- [ ] **Self-Supervised Pre-training** on large satellite datasets
- [ ] **Multi-temporal Analysis** for time-series change detection  
- [ ] **Uncertainty Quantification** with confidence maps
- [ ] **Real-time Processing** optimization for operational deployment

## 📚 Related Publications

This U-Net ASPP work contributes to ongoing research in remote sensing change detection:

> **"A Novel Change Detection Algorithm using Custom U-Net with Attention Gates, ASPP, and Bottleneck Mechanism for Optical Images"** - *Under Review, International Journal of Remote Sensing*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- Thanks to the remote sensing research community for valuable insights
- Inspired by DeepLab's ASPP module and U-Net architecture
- SURF algorithm implementation for robust feature matching

## 📞 Contact

- **Author:** Padala Hemanth Subbi Reddy
- **Email:** padala.hemanth2022@vitstudent.ac.in
- **LinkedIn:** [padala-hemanth-subbi-reddy](https://linkedin.com/in/padala-hemanth-subbi-reddy)
- **GitHub:** [@hemanthpadala03](https://github.com/hemanthpadala03)

---

<div align="center">
  
**⭐ Star this repository if you found it helpful!**

![GitHub watchers](https://img.shields.io/github/watchers/hemanthpadala03/Remote-Sensing-Change-Detection?style=social)
![GitHub forks](https://img.shields.io/github/forks/hemanthpadala03/Remote-Sensing-Change-Detection?style=social)
![GitHub stars](https://img.shields.io/github/stars/hemanthpadala03/Remote-Sensing-Change-Detection?style=social)

</div>
