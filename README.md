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

- **Custom U-Net Architecture** with attention mechanisms and ASPP (Atrous Spatial Pyramid Pooling)
- **Multiple Model Implementations** for comparative analysis
- **Pre-trained Models** ready for inference
- **Traditional vs Deep Learning** comparison using SURF feature matching
- **Comprehensive Dataset** with ground truth annotations

## 🏗️ Architecture Overview

Our primary model is a **Custom Advanced U-Net** that incorporates:

- ✅ **Attention Gates** for better feature focusing
- ✅ **ASPP Bottleneck** for multi-scale context understanding  
- ✅ **Skip Connections** with enhanced feature fusion
- ✅ **Binary Change Map Output** for precise change localization

## 📂 Repository Structure

```
📦 Remote-Sensing-Change-Detection
├── 📁 DATASET/
│   ├── 📁 Images/              # Input satellite/aerial images
│   │   ├── Architecture.png
│   │   ├── Ground truth.png
│   │   ├── Image 1.png         # Before image
│   │   ├── Image 2.png         # After image
│   │   ├── Image Matching.png
│   │   └── Unet output.png
│   └── 📁 SURF(feature matching)/  # Traditional feature matching
├── 📄 ALL_Models.ipynb         # Comprehensive model comparison
├── 📄 CNN_SVM_Transformer.ipynb  # Hybrid CNN-SVM + Transformer experiments
├── 📄 Custom_Advanced_Unet.ipynb # 🌟 Main model implementation
├── 📄 Vanilla_Unet.ipynb      # Baseline U-Net model
├── 📄 unet_model.h5           # Pre-trained model weights
└── 📄 README.md
```

## 🖼️ Visual Results

### Input Images and Change Detection Results

| Before (Image 1) | After (Image 2) | Ground Truth | Model Output |
|:----------------:|:---------------:|:------------:|:------------:|
| ![Input 1](DATASET/Images/Image%201.png) | ![Input 2](DATASET/Images/Image%202.png) | ![GT](DATASET/Images/Ground%20truth.png) | ![Output](DATASET/Images/Unet%20output.png) |

### Model Architecture

<div align="center">
  <img src="DATASET/Images/Architecture.png" alt="U-Net Architecture" width="800">
  <p><i>Custom U-Net Architecture with Attention Gates and ASPP</i></p>
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

2. **Run the main model:**
```python
# Load the pre-trained model
from tensorflow.keras.models import load_model
model = load_model('unet_model.h5')

# Inference on new image pairs
change_map = model.predict([image1, image2])
```

3. **Training from scratch:**
```bash
# Open and run Custom_Advanced_Unet.ipynb
jupyter notebook Custom_Advanced_Unet.ipynb
```

## 📊 Model Performance

| Model | IoU Score | F1 Score | Precision | Recall |
|-------|-----------|----------|-----------|--------|
| Vanilla U-Net | 0.756 | 0.821 | 0.798 | 0.845 |
| **Custom U-Net** | **0.834** | **0.887** | **0.891** | **0.883** |
| CNN + SVM | 0.698 | 0.772 | 0.758 | 0.787 |
| SURF Matching | 0.542 | 0.634 | 0.612 | 0.658 |

## 🔬 Methodology

### 1. Data Preprocessing
- Image normalization and resizing
- Data augmentation (rotation, flipping, scaling)
- Patch-based training for memory efficiency

### 2. Model Architecture
- **Encoder:** Feature extraction with downsampling
- **Bottleneck:** ASPP for multi-scale feature aggregation
- **Decoder:** Upsampling with skip connections and attention gates
- **Output:** Binary change probability map

### 3. Loss Function
```python
# Combination of Binary Cross-Entropy and Dice Loss
loss = binary_crossentropy + dice_loss
```

## 📈 Applications

- 🏙️ **Urban Development Monitoring**
- 🌿 **Environmental Change Assessment**
- 🚨 **Disaster Impact Analysis**
- 🛣️ **Infrastructure Development Tracking**
- 🌍 **Land Use/Land Cover Change Detection**

## 🔧 Technical Details

### Model Specifications
- **Input:** Two RGB images (256×256×3)
- **Output:** Binary change map (256×256×1)  
- **Architecture:** Custom U-Net with attention mechanisms
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

- [ ] **Vision Transformer Integration** for better long-range dependencies
- [ ] **Self-Supervised Pre-training** on large satellite datasets
- [ ] **Multi-temporal Change Detection** for time-series analysis  
- [ ] **Uncertainty Quantification** for confidence estimation
- [ ] **Real-time Processing** optimization for operational use

## 📚 Related Publications

This work contributes to ongoing research in remote sensing change detection:

> **"A Novel Change Detection Algorithm using Custom U-Net with Attention Gates, ASPP, and Bottleneck Mechanism for Optical Images"** - *Under Review, International Journal of Remote Sensing*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- Thanks to the remote sensing research community for valuable insights
- Inspired by U-Net architecture and attention mechanisms
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
