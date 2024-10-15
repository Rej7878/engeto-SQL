WITH year_data AS (
    SELECT
        year,
        ROUND(AVG(payroll_value), 0) AS avg_payroll_value,  
        ROUND(AVG(price_value), 1) AS avg_price_value      
    FROM t_jan_rejmont_project_sql_primary_finall
    GROUP BY year
)
SELECT
    year,
    avg_payroll_value,
    avg_price_value,
    ROUND(((avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) / LAG(avg_payroll_value) OVER (ORDER BY year)) * 100, 2) AS year_on_year_payroll_growth,
    ROUND(((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) / LAG(avg_price_value) OVER (ORDER BY year)) * 100, 2) AS year_on_year_price_growth,
    ROUND((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) * 100 / LAG(avg_price_value) OVER (ORDER BY year)
        - (avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) * 100 / LAG(avg_payroll_value) OVER (ORDER BY year),2) AS difference_growth
FROM year_data
ORDER BY year;



WITH year_data AS (
    SELECT
        year,
        ROUND(AVG(payroll_value), 0) AS avg_payroll_value,  
        ROUND(AVG(price_value), 1) AS avg_price_value      
    FROM t_jan_rejmont_project_sql_primary_finall
    GROUP BY year
)
SELECT
    year,
    CONCAT(avg_payroll_value, ' Kč') AS avg_payroll_value,  -- Přidání ' Kč'
    CONCAT(avg_price_value, ' Kč') AS avg_price_value,       -- Přidání ' Kč'
    CONCAT(ROUND(((avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) / LAG(avg_payroll_value) OVER (ORDER BY year)) * 100, 2), '%') AS year_on_year_payroll_growth, -- Přidání '%'
    CONCAT(ROUND(((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) / LAG(avg_price_value) OVER (ORDER BY year)) * 100, 2), '%') AS year_on_year_price_growth, -- Přidání '%'
    CONCAT(ROUND((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) * 100 / LAG(avg_price_value) OVER (ORDER BY year)
        - (avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) * 100 / LAG(avg_payroll_value) OVER (ORDER BY year), 2), '%') AS difference_growth -- Přidání '%'
FROM year_data
ORDER BY year;

