# Global Layoffs: Data Engineering & Analytics Pipeline

![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-orange)
![Data Engineering](https://img.shields.io/badge/Skill-ETL_Pipeline-blue)
![Status](https://img.shields.io/badge/Analysis-Exploratory-green)

## 📌 Project Overview
This project implements an end-to-end **SQL Analytics Workflow** to clean, transform, and analyze a real-world dataset of global workforce reductions (2020–2023).

The goal is to demonstrate professional data handling practices required for financial reporting and risk modeling. The project moves beyond simple queries by establishing a **Staging Layer**, implementing rigorous **Null Handling**, and performing **Time-Series Analysis** using Window Functions.

**Key Insight Areas:** Tech Sector Risk, Economic Downturn Trends, and Company Stability.

---

## 🛠️ Technical Architecture

This project follows a standard **ETL (Extract, Transform, Load)** methodology:

| Stage | Action | SQL Implementation |
| :--- | :--- | :--- |
| **1. Staging** | Create a raw copy of data to preserve integrity. | `CREATE TABLE ... LIKE`; `INSERT INTO ... SELECT` |
| **2. Cleaning** | Standardize formats and handle missing values. | `UPDATE`, `STR_TO_DATE()`, `TRIM()`, `NULL` Logic |
| **3. Deduplication** | Remove duplicate entries without data loss. | `ROW_NUMBER() OVER (PARTITION BY ...)` |
| **4. Analysis** | Generate rolling metrics and rankings. | `DENSE_RANK()`, `SUM() OVER (ORDER BY ...)` |

---

## 📂 Repository Structure

```text
Layoffs_SQL_Project/
│
├── data/
│   └── raw_layoffs.csv           # Raw dataset (Companies, Funds Raised, Dates)
│
├── sql/
│   ├── 01_setup.sql              # Database initialization & Table creation
│   ├── 02_data_cleaning.sql      # The Cleaning Pipeline (Staging, Nulls, Types)
│   ├── 03_exploratory_analysis.sql # EDA: Industry/Country breakdowns
│   └── 04_rolling_trends.sql     # Advanced: Rolling 12-month layoff totals
│
└── README.md                     # Project Documentation
