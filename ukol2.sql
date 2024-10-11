
SELECT
    payroll_year,
    ROUND(AVG(payroll_value), 0) AS avg_payroll_value,
    ROUND(price_value, 2) AS price,
    name,
    round (AVG(payroll_value) / price_value,0) AS test
FROM t_jan_rejmont_project_sql_primary_finall22 
WHERE payroll_year IN (2006, 2018)
    AND name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY payroll_year, name, price_value;


