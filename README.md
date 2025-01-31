# Breast Cancer Prediction Pipeline in R

## 📌 Project Overview
This project builds a reproducible pipeline for **breast cancer tumor type prediction** using R. 
The pipeline includes data preprocessing, model training, predictions, model explainability using SHAP and LIME, 
unit testing, and visualization.

---

## 🚀 How to Run This Pipeline

### **1️⃣ Clone the Repository**
```sh
git clone git@github.com:NYFE237/Breast-Cancer-Prediction-Pipeline-in-R.git
cd Breast-Cancer-Prediction-Pipeline-in-R
```

### **2️⃣ Install Dependencies**
If you are running this pipeline locally, install required R packages:
```r
source("install_dependencies.R")
```

### **3️⃣ Run the Pipeline**
Execute the full pipeline in one command:
```r
source("run_pipeline.R")
```

---

## 🖥️ Requirements
You need to have **Docker** installed on your machine to run this pipeline in a containerized environment.
To build and run using Docker:
```sh
docker build -t breast_cancer_pipeline .
docker run breast_cancer_pipeline
```

---

## 🤖 GitHub Actions
Each time a change gets pushed to this repo, a **GitHub Actions workflow** is triggered. This workflow:

✅ Installs R and dependencies  
✅ Runs unit tests  
✅ Trains the model  
✅ Generates visualizations  
✅ Makes predictions  

The results of these actions are saved as **artifacts** in the GitHub Actions workflow.

---

## 📂 Project Structure
```
breast-cancer-prediction-pipeline-in-R/
│── README.md
│── data/
│   ├── cancer_data.csv
│── R/
│   ├── data_processing.R
│   ├── train_model.R
│   ├── predict_cancer.R
│   ├── visualization.R
│── tests/
│   ├── test_functions.R
│── .github/workflows/
│   ├── ci_pipeline.yml
│── Dockerfile
│── install_dependencies.R
│── run_pipeline.R
│── .Rprofile
```

---

## 📝 Code Breakdown

### 🔹 **Data Preprocessing (`R/data_processing.R`)**
- Cleans and preprocesses the dataset
- Normalizes numerical features
- Saves the processed data as `cleaned_data.csv`

### 🔹 **Model Training (`R/train_model.R`)**
- Splits the dataset into training and testing sets
- Trains a **Random Forest model**
- Saves the trained model as `rf_model.rds`
- Generates **SHAP & LIME** visualizations for model explainability

### 🔹 **Predictions (`R/predict_cancer.R`)**
- Loads the trained model
- Predicts tumor types for new data
- Saves predictions to `predictions.csv`

### 🔹 **EDA & Visualizations (`R/visualization.R`)**
- Generates **correlation heatmap** of features
- Creates **boxplots** to compare feature distributions between tumor types

### 🔹 **Unit Testing (`tests/test_functions.R`)**
- Ensures data preprocessing removes missing values
- Verifies model training produces an `.rds` file
- Confirms predictions are successfully generated

---

## 📊 Model Explainability
The model predictions are explained using **SHAP & LIME**:
```r
source("R/train_model.R")  # Generates SHAP & LIME visualizations
```

---

## 🐳 Dockerization
To run the pipeline in a Docker container:
```sh
docker build -t breast_cancer_pipeline .
docker run breast_cancer_pipeline
```

---


