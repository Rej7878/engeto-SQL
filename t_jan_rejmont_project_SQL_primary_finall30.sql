CREATE TABLE t_jan_rejmont_project_SQL_primary_finall AS
WITH payroll_data AS (
    SELECT
        SUM(value) AS payroll_value,
        cp.payroll_year AS payroll_year,
        (SELECT name 
         FROM czechia_payroll_industry_branch 
         WHERE cp.industry_branch_code = code) AS branch_name
    FROM czechia_payroll AS cp
    WHERE value_type_code = 5958 
        AND calculation_code = 100
        AND industry_branch_code IS NOT NULL
        AND payroll_year IN (
            SELECT YEAR(date_from) 
            FROM czechia_price
            WHERE region_code IS NOT NULL
        )
    GROUP BY cp.industry_branch_code, cp.payroll_year
),
price_data AS (
    SELECT
        AVG(value) AS price_value,
        YEAR(date_from) AS price_year,		     
        cpc.name AS product_name,
        cpc.price_value AS P_value,
        cpc.price_unit
    FROM czechia_price AS cpi
    JOIN czechia_price_category AS cpc
    	ON cpi.category_code = cpc.code
    WHERE region_code IS NOT NULL
        AND YEAR(date_from) IN (
            SELECT payroll_year 
            FROM czechia_payroll 
            WHERE value_type_code = 5958 
              AND calculation_code = 100
              AND industry_branch_code IS NOT NULL
        )
    GROUP BY YEAR(date_from), cpc.name
),
gdp_data AS (
    SELECT
        year,
        gdp
    FROM economies
    WHERE country = 'Czech Republic' AND year BETWEEN 2006 AND 2018
)
SELECT 
    g.year,
    p.payroll_value,
    p.branch_name,
    pd.price_value,
    pd.product_name,
    pd.P_value,
    pd.price_unit,
    g.gdp
FROM payroll_data AS  p
JOIN price_data pd ON p.payroll_year = pd.price_year
JOIN gdp_data g ON p.payroll_year = g.year;
