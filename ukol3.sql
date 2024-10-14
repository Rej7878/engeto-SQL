SELECT 
    CONCAT(product_name, ' ', p_value, ' ', price_unit) AS product_info,
    ROUND(AVG(CASE WHEN year = '2006' THEN price_value END), 1) AS "2006",
    ROUND(AVG(CASE WHEN year = '2007' THEN price_value END), 1) AS "2007",
    ROUND(AVG(CASE WHEN year = '2008' THEN price_value END), 1) AS "2008",
    ROUND(AVG(CASE WHEN year = '2009' THEN price_value END), 1) AS "2009",
    ROUND(AVG(CASE WHEN year = '2010' THEN price_value END), 1) AS "2010",
    ROUND(AVG(CASE WHEN year = '2011' THEN price_value END), 1) AS "2011",
    ROUND(AVG(CASE WHEN year = '2012' THEN price_value END), 1) AS "2012",
    ROUND(AVG(CASE WHEN year = '2013' THEN price_value END), 1) AS "2013",
    ROUND(AVG(CASE WHEN year = '2014' THEN price_value END), 1) AS "2014",
    ROUND(AVG(CASE WHEN year = '2015' THEN price_value END), 1) AS "2015",
    ROUND(AVG(CASE WHEN year = '2016' THEN price_value END), 1) AS "2016",
    ROUND(AVG(CASE WHEN year = '2017' THEN price_value END), 1) AS "2017",
    ROUND(AVG(CASE WHEN year = '2018' THEN price_value END), 1) AS "2018",
    CONCAT(
        ROUND(
            ( (COALESCE(AVG(CASE WHEN year = '2018' THEN price_value END), AVG(CASE WHEN year = '2015' THEN price_value END)) - 
                COALESCE(AVG(CASE WHEN year = '2006' THEN price_value END), AVG(CASE WHEN year = '2015' THEN price_value END))) / 
                COALESCE(AVG(CASE WHEN year = '2006' THEN price_value END), AVG(CASE WHEN year = '2015' THEN price_value END))
            ) * 100, 0
        ), '%'
    ) AS Growth 
FROM t_jan_rejmont_project_sql_primary_finall
GROUP BY product_info
ORDER BY Growth;


