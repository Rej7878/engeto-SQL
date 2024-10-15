WITH year_data AS (
    SELECT
        year,
        ROUND(AVG(payroll_value), 0) AS avg_payroll_value,  -- Průměr platů zaokrouhlený na celé číslo
        ROUND(AVG(price_value), 1) AS avg_price_value,       -- Průměr cen potravin zaokrouhlený na jedno desetinné místo
        AVG(gdp) AS gdp  -- Přidání průměrného HDP pro daný rok
    FROM t_jan_rejmont_project_sql_primary_finall
    GROUP BY year
)
SELECT
    year,
    CONCAT(avg_payroll_value, ' Kč') AS avg_payroll_value,  -- Průměrné mzdy s jednotkou Kč
    CONCAT(avg_price_value, ' Kč') AS avg_price_value,       -- Průměrné ceny s jednotkou Kč
    CONCAT(ROUND(((avg_payroll_value - LAG(avg_payroll_value) OVER (ORDER BY year)) / LAG(avg_payroll_value) OVER (ORDER BY year)) * 100, 2), ' %') AS year_on_year_payroll_growth, -- Meziroční růst platů s jednotkou %
    CONCAT(ROUND(((avg_price_value - LAG(avg_price_value) OVER (ORDER BY year)) / LAG(avg_price_value) OVER (ORDER BY year)) * 100, 2), ' %') AS year_on_year_price_growth,        -- Meziroční růst cen potravin s jednotkou %
    CONCAT(ROUND(((gdp - LAG(gdp) OVER (ORDER BY year)) / LAG(gdp) OVER (ORDER BY year)) * 100, 2), ' %') AS year_on_year_gdp_growth,  -- Meziroční růst HDP s jednotkou %
    CONCAT(gdp, ' Kč') AS gdp  -- Průměrné HDP s jednotkou Kč
FROM year_data
ORDER BY YEAR;


