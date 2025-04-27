# 🛰️ Remote Sensing Change Detection

This repository contains various models and techniques developed for detecting changes in satellite or aerial images using deep learning and traditional methods.

## 📂 Repository Structure

- `DATASET/` — Contains input satellite/aerial images and ground truth data for change detection tasks.
- `SURF (feature matching)/` — Implementation of SURF-based feature matching for preliminary change analysis.
- `ALL_Models.ipynb` — Notebook consolidating multiple deep learning models for comparative study.
- `CNN_SVM_Transformer.ipynb` — Experiments combining CNN feature extraction with SVM classifiers and Transformer-based models.
- `Custom_Advanced_Unet.ipynb` — A custom U-Net architecture enhanced with attention mechanisms and bottleneck structures for better performance.
- `Vanilla_Unet.ipynb` — A baseline U-Net model for change detection comparison.
- `unet_model.h5` — Pre-trained U-Net model that takes two input images and outputs a binary change map.
- `README.md` — This documentation file.

## 🚀 Project Highlights

- Developed and trained a custom U-Net model for binary change detection between two images.
- Created a pre-trained model (`unet_model.h5`) ready for inference on new data.
- Compared deep learning models with traditional feature-matching approaches like SURF.
- Explored CNN + SVM hybrid models and initial experiments with Transformer architectures.
- Curated a clean dataset specifically structured for remote sensing change analysis.

## 🛠️ Technologies Used

- Python
- TensorFlow / Keras
- Scikit-learn
- OpenCV
- Satellite/Aerial Image Processing Libraries

## 📈 Future Work

- Incorporating self-supervised learning for better feature extraction.
- Adding Transformer-based segmentation models like SegFormer.
- Benchmarking on public datasets such as LEVIR-CD or S2Looking.

## 🤝 Acknowledgements

This work was developed as part of a remote sensing change detection study project. Special thanks to the open-source community for providing accessible datasets and tools.

---

*Feel free to star ⭐ this repo if you find the work useful!*
