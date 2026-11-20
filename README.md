# 🫀 Heart Disease Prediction Using Data Science Techniques in R

![R Version](https://shields.io)
![Status](https://shields.io)
![University](https://shields.io)
![Course](https://shields.io)

### 🌐 Live Interactive Report
👉 **[Click Here to View the Full Interactive HTML Report Online](https://yazan-qasem.github.io/R-Data-Science-Project/Report/HTML.html)**

---

## 👨‍💻 Student & Course Information

| Field | Details |
| :--- | :--- |
| **Student Name** | Yazan Zuhair Ibrahim Qasem |
| **Student ID** | `2200908643` |
| **Course** | Programming for Data Science in R (`908302`) |
| **Instructor** | Dr. Mohammad Al-Awn |
| **Institution** | Al Al-Bayt University — Faculty of Information Technology |

---

## 📌 Project Overview
This repository presents a comprehensive, end-to-end data science pipeline built in **R** using the **Heart Prediction Quantum Dataset** (`500` patient records, `7` clinical & engineered attributes). The objective is to explore physiological risk factors, discover latent patient clusters, and benchmark four supervised machine learning classifiers for predicting cardiovascular disease (`HeartDisease`).

### Key Findings at a Glance
* **Data Integrity:** Zero missing values (`NA`) and zero duplicate rows; balanced target distribution (`60%` Heart Disease vs. `40%` No Disease).
* **Unsupervised Clustering (K-Means):** With `k = 2`, the first two principal components explain **55.15%** of variance, separating positive cases (227/300 in Cluster 1) from healthy subjects (167/200 in Cluster 2).
* **Best Classification Model:** **Decision Tree** outperformed all other classifiers with **93.33% Accuracy** and **93.75% F-Measure**.

| Classification Model | Accuracy (%) | Classification Error (%) | Precision (%) | Recall (%) | F-Measure (%) |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Decision Tree** | **93.33** | **6.67** | **97.40** | 90.36 | **93.75** |
| **Naive Bayes** | 90.67 | 9.33 | 90.59 | **92.77** | 91.67 |
| **SVM (Radial Kernel)** | 90.67 | 9.33 | 90.59 | **92.77** | 91.67 |
| **KNN (`k = 5`)** | 86.00 | 14.00 | 85.23 | 90.36 | 87.72 |

---

## 📂 Repository Structure

```text
R-Data-Science-Project/
├── R-Data-Science-Project.Rproj   # RStudio Project file (ensures relative paths without setwd)
├── README.md                      # Project documentation, live report link, and methodology
│
├── Data/
│   └── Heart Prediction Quantum Dataset (1).csv   # Raw clinical dataset (500 x 7)
│
├── Scripts/
│   ├── 01_eda_and_cleaning.R      # Part 1: Preprocessing, custom stats (sapply), plots & correlation
│   ├── 02_kmeans_clustering.R     # Part 2: K-Means clustering (k = 2, 3, 4, 5) & clusplot
│   └── 03_supervised_ml.R         # Part 3: Naive Bayes, Decision Tree, KNN & SVM evaluation
│
├── Report/
│   ├── HTML.Rmd                   # Reproducible R Markdown source file
│   └── HTML.html                  # Compiled interactive HTML report
│
└── Slides/
    └── Presentation.pptx          # Final defense presentation slides
```

---

## 🚀 How to Reproduce Locally

1. **Clone the Repository:**
   ```bash
   git clone https://github.com
   ```
2. **Open in RStudio:**
   Double-click `R-Data-Science-Project.Rproj` to automatically configure the project root directory (no `setwd()` required).
3. **Install Dependencies:**
   Run the following command in the R Console:
   ```r
   install.packages(c("car", "corrplot", "cluster", "e1071", "rpart", "class", "rmarkdown", "knitr"))
   ```
4. **Execute Scripts or Knit Report:**
   * Run scripts inside `Scripts/` sequentially (`01` → `02` → `03`).
   * Or open `Report/HTML.Rmd` and click **Knit** to regenerate the full HTML report.

---

## 📚 References (APA Format)
* James, G., Witten, D., Hastie, T., & Tibshirani, R. (2021). *An introduction to statistical learning with applications in R* (2nd ed.). Springer.
* Mailund, T. (2017). *Beginning data science in R: Data analysis, visualization, and modelling for the data scientist*. Apress.
* R Core Team. (2024). *R: A language and environment for statistical computing*. R Foundation for Statistical Computing. https://r-project.org
* Venables, W. N., Smith, D. M., & R Core Team. (2024). *An introduction to R* (Version 4.4.0). R Foundation for Statistical Computing.

---

## 🤖 AI Usage Disclosure & Academic Integrity
In compliance with course academic integrity guidelines, an AI assistant (**Google Gemini**) was used as a supportive tool during this project for:
1. Structuring the GitHub repository layout and configuring RStudio version control.
2. Refactoring repetitive R code into clean, modular custom functions (`calc_stats()` and `evaluate_model()`).
3. Troubleshooting package library paths and R Markdown YAML/HTML rendering.

All scripts, statistical calculations, visualizations, machine learning experiments, and interpretations were executed, validated, and reviewed independently by the student.
