-- ===========================================
-- 04_rolling_trends.sql
-- Rolling totals + rankings (window functions)
-- ===========================================

USE layoffs_portfolio;

-- 1) Monthly totals + rolling total
WITH monthly AS (
  SELECT
    DATE_FORMAT(`date`, '%Y-%m-01') AS month_start,
    SUM(total_laid_off) AS layoffs
  FROM layoffs_clean
  WHERE `date` IS NOT NULL
  GROUP BY month_start
)
SELECT
  month_start,
  layoffs,
  SUM(layoffs) OVER (ORDER BY month_start) AS rolling_total
FROM monthly
ORDER BY month_start;

-- 2) Top 5 companies per year by layoffs
WITH yearly_company AS (
  SELECT
    YEAR(`date`) AS yr,
    company,
    SUM(total_laid_off) AS layoffs
  FROM layoffs_clean
  WHERE `date` IS NOT NULL
  GROUP BY yr, company
),
ranked AS (
  SELECT
    yr,
    company,
    layoffs,
    DENSE_RANK() OVER (PARTITION BY yr ORDER BY layoffs DESC) AS rnk
  FROM yearly_company
)
SELECT *
FROM ranked
WHERE rnk <= 5
ORDER BY yr, rnk, company;
