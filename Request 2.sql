#Request 2 - What is the percentage of unique product increase in 2021 vs. 2020?

WITH up_2020 AS (
SELECT COUNT(DISTINCT product_code) AS unique_products
FROM fact_sales_monthly
WHERE fiscal_year = 2020
),
up_2021 AS (
SELECT COUNT(DISTINCT product_code) AS unique_products
FROM fact_sales_monthly
WHERE fiscal_year = 2021
)
SELECT up_2020.unique_products AS unique_products_2020,
	up_2021.unique_products AS unique_products_2021,
    CONCAT(ROUND((((up_2021.unique_products - up_2020.unique_products) / up_2020.unique_products) * 100), 2), "%") AS percentage_chg
FROM up_2020
CROSS JOIN up_2021;