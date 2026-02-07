-- ===========================================
-- 03_exploratory_analysis.sql
-- Basic EDA queries
-- ===========================================

USE layoffs_portfolio;

-- 1) Top companies by total layoffs
SELECT company, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;

-- 2) Layoffs by industry
SELECT industry, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
GROUP BY industry
ORDER BY total_laid_off DESC;

-- 3) Layoffs by country
SELECT country, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
GROUP BY country
ORDER BY total_laid_off DESC;

-- 4) Layoffs by year
SELECT YEAR(`date`) AS yr, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
WHERE `date` IS NOT NULL
GROUP BY yr
ORDER BY yr;

-- 5) Top stages by total layoffs
SELECT stage, SUM(total_laid_off) AS total_laid_off
FROM layoffs_clean
GROUP BY stage
ORDER BY total_laid_off DESC;
