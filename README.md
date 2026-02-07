# Global-Layoffs-Data-Cleaning-Exploratory-Analysis
This project focuses on cleaning and analyzing a real-world layoffs dataset covering major workforce reductions from 2020 to 2023.
The goal is to demonstrate a complete SQL analytics workflow, including:

- building staging tables
- handling missing and inconsistent values
- removing duplicates using window functions
- performing exploratory data analysis (EDA)
- generating rolling layoff trends over time

This project highlights practical SQL skills commonly used in **data analytics, risk analysis, and financial reporting** roles.

---

## Dataset
The dataset contains company layoff information across industries, countries, and funding stages.

Key columns include:

- `company`
- `industry`
- `location`
- `total_laid_off`
- `percentage_laid_off`
- `date`
- `stage`
- `country`
- `funds_raised_millions`

Raw file: `data/raw_layoffs.csv`

---

## Tools & Skills Demonstrated

- **MySQL 8+**
- Data Cleaning Techniques:
  - trimming and standardizing text fields
  - converting string-based NULL values into real SQL NULLs
  - formatting and converting date columns
- Deduplication using:
  - `ROW_NUMBER()` + CTEs
- Exploratory Analysis using:
  - `GROUP BY`, `ORDER BY`
  - aggregation functions (`SUM`, `AVG`, `COUNT`)
- Advanced SQL Concepts:
  - window functions (`DENSE_RANK`, rolling totals)

---

## Project Structure
