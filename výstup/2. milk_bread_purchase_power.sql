/*
Script je napsany pro vizualizace v SQL
*/


SELECT
    CONCAT(product_name, ' ', P_value, ' ', price_unit) AS name, 
    ROUND(AVG(CASE WHEN year = 2006 THEN payroll_value END), 0) AS avg_payroll_value_2006,
    ROUND(AVG(CASE WHEN year = 2006 THEN price_value END), 2) AS price_2006,
    ROUND(AVG(CASE WHEN year = 2006 THEN payroll_value END) / AVG(CASE WHEN year = 2006 THEN price_value END), 0) AS units_2006,    
    ROUND(AVG(CASE WHEN year = 2018 THEN payroll_value END), 0) AS avg_payroll_value_2018,
    ROUND(AVG(CASE WHEN year = 2018 THEN price_value END), 2) AS price_2018,
    ROUND(AVG(CASE WHEN year = 2018 THEN payroll_value END) / AVG(CASE WHEN year = 2018 THEN price_value END), 0) AS units_2018,
    ROUND(AVG(CASE WHEN year = 2018 THEN payroll_value END) / AVG(CASE WHEN year = 2018 THEN price_value END), 0) - ROUND(AVG(CASE WHEN year = 2006 THEN payroll_value END) / AVG(CASE WHEN year = 2006 THEN price_value END), 0) AS units_difference  
FROM t_jan_rejmont_project_sql_primary_finall
WHERE year IN (2006, 2018)
  AND product_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY name;




/*
Script napsany jako univerzalní reseni, aby se nemusel kazdy rok menit udaj. 
Pro finalni vizualizaci ve vizualizacnich nastrojich.
*/

SELECT
    year,
    CONCAT(product_name, ' ', P_value, ' ', price_unit) AS name, 
    ROUND(AVG(payroll_value)) AS avg_payroll_value,
    ROUND(AVG(price_value), 2) AS avg_price_value,
    ROUND(AVG(payroll_value) / AVG(price_value)) AS units
FROM t_jan_rejmont_project_sql_primary_finall
WHERE year IN (
        (SELECT MIN(year) FROM t_jan_rejmont_project_sql_primary_finall),
        (SELECT MAX(year) FROM t_jan_rejmont_project_sql_primary_finall)
    )
    AND product_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
GROUP BY year, product_name;

