WITH year_data AS (
    SELECT
        year,
        ROUND(AVG(payroll_value), 0) AS avg_payroll_value,  
        ROUND(AVG(price_value), 1) AS avg_price_value,       
        AVG(gdp) AS gdp  
    FROM t_jan_rejmont_project_sql_primary_finall
    GROUP BY year
)
SELECT
    year,
    CONCAT(avg_payroll_value, ' Kč') AS avg_payroll_value,  
    CONCAT(avg_price_value, ' Kč') AS avg_price_value,       
    CONCAT(ROUND(((avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) / LAG(avg_payroll_value) OVER (ORDER BY year)) * 100, 2), ' %') AS year_on_year_payroll_growth, 
    CONCAT(ROUND(((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) / LAG(avg_price_value) OVER (ORDER BY year)) * 100, 2), ' %') AS year_on_year_price_growth,        
    CONCAT(ROUND(((gdp - LAG(gdp) OVER (ORDER BY year)) / LAG(gdp) OVER (ORDER BY year)) * 100, 2), ' %') AS year_on_year_gdp_growth,  
    CONCAT(gdp, ' Kč') AS gdp 
FROM year_data
ORDER BY YEAR;


