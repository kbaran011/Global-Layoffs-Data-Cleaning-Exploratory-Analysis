-- ===========================================
-- 02_data_cleaning.sql
-- Cleaning pipeline -> produces layoffs_clean
-- ===========================================

USE layoffs_portfolio;

-- 0) Create staging table with a surrogate key (row_id)
DROP TABLE IF EXISTS layoffs_stage;
CREATE TABLE layoffs_stage AS
SELECT *
FROM layoffs_raw;

ALTER TABLE layoffs_stage
ADD COLUMN row_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

-- 1) Basic standardization
UPDATE layoffs_stage
SET company = TRIM(company),
    location = TRIM(location),
    industry = TRIM(industry),
    stage = TRIM(stage),
    country = TRIM(country),
    `date` = TRIM(`date`);

-- Normalize common "NULL-like" strings to real NULL
UPDATE layoffs_stage
SET industry = NULL
WHERE industry IN ('', 'NULL', 'null', 'N/A', 'n/a');

UPDATE layoffs_stage
SET stage = NULL
WHERE stage IN ('', 'NULL', 'null', 'N/A', 'n/a');

UPDATE layoffs_stage
SET location = NULL
WHERE location IN ('', 'NULL', 'null', 'N/A', 'n/a');

UPDATE layoffs_stage
SET country = NULL
WHERE country IN ('', 'NULL', 'null', 'N/A', 'n/a');

UPDATE layoffs_stage
SET `date` = NULL
WHERE `date` IN ('', 'NULL', 'null', 'N/A', 'n/a', 'date');

-- 2) Country cleanup (common issue: trailing period)
UPDATE layoffs_stage
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE '%.';

-- 3) Convert date text -> DATE
-- Preview conversion:
-- SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y') FROM layoffs_stage LIMIT 20;

UPDATE layoffs_stage
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date` IS NOT NULL;

ALTER TABLE layoffs_stage
MODIFY COLUMN `date` DATE;

-- 4) Deduplicate
-- Identify duplicates by matching on all business columns (excluding row_id).
-- Keep row_num=1, delete row_num>1

WITH ranked AS (
  SELECT
    row_id,
    ROW_NUMBER() OVER (
      PARTITION BY company, location, industry, total_laid_off,
                   percentage_laid_off, `date`, stage, country, funds_raised_millions
      ORDER BY row_id
    ) AS row_num
  FROM layoffs_stage
)
DELETE FROM layoffs_stage
WHERE row_id IN (SELECT row_id FROM ranked WHERE row_num > 1);

-- 5) Drop rows with no layoff info (both missing)
DELETE FROM layoffs_stage
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;

-- 6) Create final cleaned table
DROP TABLE IF EXISTS layoffs_clean;
CREATE TABLE layoffs_clean AS
SELECT
  company,
  location,
  industry,
  total_laid_off,
  percentage_laid_off,
  `date`,
  stage,
  country,
  funds_raised_millions
FROM layoffs_stage;

-- 7) Final checks
SELECT COUNT(*) AS clean_rows FROM layoffs_clean;
SELECT * FROM layoffs_clean LIMIT 10;
