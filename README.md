# 🏥 Oncology Treatment Outcomes Analysis – SQL Project

## Overview

Data analysis project exploring cancer treatment outcomes across hospitals using SQL. Built on a dataset of 450+ patient records to identify survival rate patterns, cost-effectiveness of treatments, and the impact of cancer stage on patient outcomes.

---

## ❓ Key Questions Explored

- Which hospital achieves the highest patient survival rate?
- Does spending more on treatment actually improve outcomes?
- How significantly does cancer stage affect survival probability?

---

## 📈 Key Findings

| Finding | Result |
|---------|--------|
| Highest survival rate | Mayo Clinic (~63.7%) |
| Survival range across hospitals | ~60–64% (relatively consistent) |
| Cost vs outcome correlation | Higher cost ≠ better survival |
| Early-stage survival advantage | Significantly higher than late-stage |

> ⚠️ These results are **correlational** — not causal. No control for patient demographics or comorbidities.

---

## 🛠 Tech Stack

| Tool | Usage |
|------|-------|
| SQL (PostgreSQL) | Data querying, aggregation, KPI analysis |
| ETL Pipeline | Data extraction, cleaning, and loading (450+ records) |

---

## 📂 Files

| File | Description |
|------|-------------|
| `oncologyproject.sql` | All SQL queries used for the analysis |

---

## 🔍 Analysis Breakdown

**1. Hospital Performance**
- Compared survival rates across multiple hospitals
- Identified top and bottom performers

**2. Cost-Outcome Analysis**
- Segmented patients by treatment cost tier
- Tested whether higher spend correlates with survival

**3. Cancer Stage Impact**
- Grouped patients by diagnosis stage (early vs late)
- Quantified survival probability difference across stages

---

## ⚠️ Limitations

- No control for patient age, demographics, or comorbidities
- Dataset is anonymized — hospital names are pseudonymous
- Findings are observational, not causal

---

## 👩‍💻 About

Built by [Srishma Reddy Manne](https://linkedin.com/in/srishma-reddy-manne) — M.Sc. Data Science student at HAW Kiel, Germany.  
🔗 [LinkedIn](https://linkedin.com/in/srishma-reddy-manne) · [GitHub](https://github.com/Srishma0912)
