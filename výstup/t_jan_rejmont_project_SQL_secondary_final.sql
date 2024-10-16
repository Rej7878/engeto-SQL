SELECT
	e.country,
	e.YEAR,
	e.gdp,
	e.population,
	e.gini,
	e.taxes,
	c.currency_code,
	c.region_in_world 
FROM economies AS e 
JOIN countries AS c
	ON e.country = c.country
	WHERE YEAR BETWEEN 2006 AND 2018;




