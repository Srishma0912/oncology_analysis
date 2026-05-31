#🏥 Oncology Treatment Outcomes Analysis – SQL & Machine Learning

## Overview
End-to-end data project exploring cancer treatment outcomes across hospitals using SQL and machine learning. Built on a dataset of 450+ patient records to identify survival rate patterns, cost-effectiveness of treatments, and the impact of cancer stage on patient outcomes — and to predict patient survival using ML classification models.

---

## ❓ Key Questions Explored
- Which hospital achieves the highest patient survival rate?
- Does spending more on treatment actually improve outcomes?
- How significantly does cancer stage affect survival probability?
- Can we predict whether a patient survives based on clinical and operational features?

---

## 📈 Key Findings

| Finding | Result |
|---------|--------|
| Highest survival rate | Mayo Clinic (~63.7%) |
| Survival range across hospitals | ~60–64% (relatively consistent) |
| Cost vs outcome correlation | Higher cost ≠ better survival |
| Early-stage survival advantage | Significantly higher than late-stage |
| Best ML model (F1) | Logistic Regression (F1: 0.75, CV F1: 0.74) |
| Strongest survival predictor | Treatment_Response_Score & Time_to_Response_Days |

> ⚠️ These results are **correlational** — not causal. No control for patient demographics or comorbidities.

---

## 🛠 Tech Stack

| Tool | Usage |
|------|-------|
| SQL (MySQL) | Data querying, aggregation, KPI analysis |
| Python | Machine learning, data preprocessing, visualisation |
| scikit-learn | Logistic Regression, Random Forest, cross-validation |
| pandas / NumPy | Data manipulation and feature engineering |
| Matplotlib / Seaborn | Confusion matrices, feature importance plots |

---

## 📂 Files

| File | Description |
|------|-------------|
| `oncologyproject.sql` | All SQL queries used for the analysis |
| `oncology_ml_models.ipynb` | ML models — Logistic Regression & Random Forest |
| `oncology_ml_results.png` | Confusion matrices & feature importance chart |
| `cancer_treatment_performance_global_kpis_dataset.csv` | Dataset (450 records) |

---

## 🔍 Analysis Breakdown

**1. Hospital Performance**
- Compared survival rates across multiple hospitals
- Identified top and bottom performers
- Mayo Clinic: best overall value (63.74% survival, mid-tier pricing)
- Johns Hopkins: Stage IV specialist (85% survival for critical cases)

**2. Cost-Outcome Analysis**
- Segmented patients by treatment cost tier
- Tested whether higher spend correlates with survival
- Sloan Kettering is most expensive but underperforms vs Mayo Clinic

**3. Cancer Stage Impact**
- Grouped patients by diagnosis stage (early vs late)
- Quantified survival probability difference across stages

**4. Machine Learning Models**

Target: Predict `Survival_Status` (Alive / Deceased)

Features: Stage, Drug_Regimen, Hospital, Diagnosis, Treatment_Cost_USD, Time_to_Response_Days, Treatment_Response_Score, Number_of_Cycles

Train/Test Split: 80/20 with stratification | 5-fold cross-validation

| Model | Accuracy | Precision | Recall | F1 Score | CV F1 |
|-------|----------|-----------|--------|----------|-------|
| Logistic Regression | 0.6111 | 0.6163 | 0.9636 | 0.7518 | 0.7440 |
| Random Forest | 0.4444 | 0.5362 | 0.6727 | 0.5968 | 0.6670 |

Logistic Regression achieves high recall (0.96) — correctly identifying almost all surviving patients, which is the priority in a clinical context.

![Model Results](oncology_ml_results.png)

---

## ⚠️ Limitations
- No control for patient age, demographics, or comorbidities
- Dataset is anonymized — hospital names are pseudonymous
- Findings are observational, not causal

---

## 👩‍💻 About
Built by [Srishma Reddy Manne](https://linkedin.com/in/srishma-reddy-manne) — M.Sc. Data Science student at HAW Kiel, Germany.  
🔗 [LinkedIn](https://linkedin.com/in/srishma-reddy-manne) · [GitHub](https://github.com/Srishma0912)
