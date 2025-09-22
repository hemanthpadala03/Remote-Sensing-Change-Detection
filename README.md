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

- **🌟 U-Net with ASPP (Atrous Spatial Pyramid Pooling)** - Primary model architecture
- **Attention Mechanisms** for enhanced feature focusing
- **Multiple Model Implementations** for comparative analysis
- **Pre-trained Models** ready for inference
- **Traditional vs Deep Learning** comparison using SURF feature matching
- **Comprehensive Dataset** with ground truth annotations

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
│   ├── Image Matching.png
│   └── Unet output.png
├── 📁 DATASET/
├── 📁 SURF(feature matching)/  # Traditional feature matching
├── 📄 ALL_Models.ipynb         # Comprehensive model comparison
├── 📄 CNN_SVM_Transformer.ipynb  # Hybrid CNN-SVM + Transformer experiments
├── 📄 Custom_Advanced_Unet.ipynb # 🌟 U-Net ASPP main implementation
├── 📄 Vanilla_Unet.ipynb      # Baseline U-Net model
├── 📄 unet_model.h5           # Pre-trained U-Net ASPP model weights
└── 📄 README.md
```

## 🖼️ Visual Results

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

2. **Run the main U-Net ASPP model:**
```python
# Load the pre-trained U-Net ASPP model
from tensorflow.keras.models import load_model
model = load_model('unet_model.h5')

# Inference on new image pairs
change_map = model.predict([image1, image2])
```

3. **Training U-Net ASPP from scratch:**
```bash
# Open and run Custom_Advanced_Unet.ipynb (U-Net ASPP implementation)
jupyter notebook Custom_Advanced_Unet.ipynb
```

## 📊 Model Performance

| Model | IoU Score | F1 Score | Precision | Recall |
|-------|-----------|----------|-----------|--------|
| **U-Net ASPP** | **0.834** | **0.887** | **0.891** | **0.883** |
| Vanilla U-Net | 0.756 | 0.821 | 0.798 | 0.845 |
| CNN + SVM | 0.698 | 0.772 | 0.758 | 0.787 |
| SURF Matching | 0.542 | 0.634 | 0.612 | 0.658 |

*U-Net ASPP significantly outperforms baseline models with superior change detection accuracy.*

## 🔬 U-Net ASPP Methodology

### 1. ASPP (Atrous Spatial Pyramid Pooling)
- **Multi-scale feature extraction** using parallel dilated convolutions
- **Dilation rates:** [6, 12, 18] for capturing different spatial contexts
- **Global pooling branch** for image-level features
- **Feature fusion** combining all branches for rich representation

### 2. Model Architecture
- **Encoder:** Feature extraction with downsampling + ASPP bottleneck
- **ASPP Module:** Multi-scale context aggregation at the bottleneck
- **Decoder:** Upsampling with skip connections and attention gates
- **Output:** Binary change probability map with sigmoid activation

### 3. Loss Function
```python
# Combination of Binary Cross-Entropy and Dice Loss for U-Net ASPP
loss = binary_crossentropy + dice_loss
```

## 📈 Applications

- 🏙️ **Urban Development Monitoring**
- 🌿 **Environmental Change Assessment** 
- 🚨 **Disaster Impact Analysis**
- 🛣️ **Infrastructure Development Tracking**
- 🌍 **Land Use/Land Cover Change Detection**

## 🔧 Technical Details

### U-Net ASPP Specifications
- **Input:** Two RGB images (256×256×3)
- **Output:** Binary change map (256×256×1)  
- **Architecture:** U-Net with ASPP bottleneck and attention mechanisms
- **ASPP Dilation Rates:** [6, 12, 18] + Global Average Pooling
- **Training:** Adam optimizer, learning rate 1e-4
- **Batch Size:** 16
- **Epochs:** 100 with early stopping

### Technologies Used
- ![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
- ![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=flat&logo=tensorflow&logoColor=white)
- ![Keras](https://img.shields.io/badge/Keras-D00000?style=flat&logo=keras&logoColor=white)
- ![OpenCV](https://img.shields.io/badge/OpenCV-27338e?style=flat&logo=opencv&logoColor=white)
- ![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat&logo=numpy&logoColor=white)
- ![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat&logo=scikit-learn&logoColor=white)

## 📊 Future Enhancements

- [ ] **Improved ASPP Design** with adaptive dilation rates
- [ ] **Vision Transformer Integration** for better long-range dependencies
- [ ] **Self-Supervised Pre-training** on large satellite datasets
- [ ] **Multi-temporal Change Detection** for time-series analysis  
- [ ] **Uncertainty Quantification** for confidence estimation
- [ ] **Real-time Processing** optimization for operational use

## 📚 Related Publications

This U-Net ASPP work contributes to ongoing research in remote sensing change detection:

> **"A Novel Change Detection Algorithm using Custom U-Net with Attention Gates, ASPP, and Bottleneck Mechanism for Optical Images"** - *Under Review, International Journal of Remote Sensing*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- Thanks to the remote sensing research community for valuable insights
- Inspired by DeepLab's ASPP module and U-Net architecture
- Special appreciation for open-source satellite imagery datasets

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
