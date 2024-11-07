CREATE OR REPLACE TABLE t_jan_rejmont_project_sql_secondary_finall AS
SELECT
    e.country,
    e.year,
    e.gdp,
    e.population,
    e.gini,
    e.taxes,
    c.currency_code,
    c.region_in_world 
FROM economies AS e 
JOIN countries AS c
    ON e.country = c.country
WHERE e.year IN (SELECT DISTINCT year FROM t_jan_rejmont_project_sql_primary_finall);









