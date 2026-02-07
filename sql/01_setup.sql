-- ===========================================
-- 01_setup.sql
-- Global Layoffs project (MySQL 8+)
-- ===========================================

-- 1) Create / select a database
CREATE DATABASE IF NOT EXISTS layoffs_portfolio;
USE layoffs_portfolio;

-- 2) Create raw table
DROP TABLE IF EXISTS layoffs_raw;
CREATE TABLE layoffs_raw (
  company VARCHAR(255),
  location VARCHAR(255),
  industry VARCHAR(255),
  total_laid_off INT NULL,
  percentage_laid_off DECIMAL(6,4) NULL,
  `date` VARCHAR(50),
  stage VARCHAR(255),
  country VARCHAR(255),
  funds_raised_millions INT NULL
);

-- 3) Quick sanity check
SELECT COUNT(*) AS raw_rows FROM layoffs_raw;
SELECT * FROM layoffs_raw LIMIT 10;
