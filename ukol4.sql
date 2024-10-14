WITH year_data AS (
    SELECT
        year,
        ROUND(AVG(payroll_value), 0) AS avg_payroll_value,  -- Průměr platů zaokrouhlený na celé číslo
        ROUND(AVG(price_value), 1) AS avg_price_value       -- Průměr cen potravin zaokrouhlený na jedno desetinné místo
    FROM t_jan_rejmont_project_sql_primary_finall
    GROUP BY year
)
SELECT
    year,
    avg_payroll_value,
    avg_price_value,
    ROUND(((avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) / LAG(avg_payroll_value) OVER (ORDER BY year)) * 100, 2) AS payroll_growth, -- Meziroční růst platů
    ROUND(((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) / LAG(avg_price_value) OVER (ORDER BY year)) * 100, 2) AS price_growth,        -- Meziroční růst cen potravin
    ROUND(ROUND(((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) / LAG(avg_price_value) OVER (ORDER BY year)) * 100, 2) - 
        ROUND(((avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) / LAG(avg_payroll_value) OVER (ORDER BY year)) * 100, 2), 2) AS difference_growth -- Rozdíl mezi růstem cen a růstem platů
FROM year_data
ORDER BY year;









