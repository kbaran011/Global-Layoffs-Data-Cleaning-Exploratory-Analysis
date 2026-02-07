# Layoffs Dataset — Key Insights (Template)

> Replace the placeholders below with a few key findings from your analysis queries.

## Cleaning Summary
- Removed duplicate rows using `ROW_NUMBER()` and a surrogate key.
- Standardized text fields (trimmed company names; normalized NULL-like strings).
- Converted `date` from text to a proper `DATE` type.
- Dropped rows where both `total_laid_off` and `percentage_laid_off` were missing.

## Highlights
- **Top industries by total layoffs:** (add your top 3–5)
- **Top countries by total layoffs:** (add your top 3–5)
- **Largest single-company totals:** (add your top 5)

## Trend Notes
- Monthly rolling totals show distinct “waves” of layoffs.
- (Add 2–3 sentences interpreting peaks and declines.)

## Next Improvements
- Add a dashboard (Power BI/Tableau) using the cleaned CSV export.
- Add segmentation by stage (e.g., Post-IPO vs Series A/B).
