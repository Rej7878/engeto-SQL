SELECT 
    branch_name,
    MAX(CASE WHEN payroll_year = '2006' THEN payroll_value END) AS "2006",
    MAX(CASE WHEN payroll_year = '2007' THEN payroll_value END) AS "2007",
    MAX(CASE WHEN payroll_year = '2008' THEN payroll_value END) AS "2008",
    MAX(CASE WHEN payroll_year = '2009' THEN payroll_value END) AS "2009",
    MAX(CASE WHEN payroll_year = '2010' THEN payroll_value END) AS "2010",
    MAX(CASE WHEN payroll_year = '2011' THEN payroll_value END) AS "2011",
    MAX(CASE WHEN payroll_year = '2012' THEN payroll_value END) AS "2012",
    MAX(CASE WHEN payroll_year = '2013' THEN payroll_value END) AS "2013",
    MAX(CASE WHEN payroll_year = '2014' THEN payroll_value END) AS "2014",
    MAX(CASE WHEN payroll_year = '2015' THEN payroll_value END) AS "2015",
    MAX(CASE WHEN payroll_year = '2016' THEN payroll_value END) AS "2016",
    MAX(CASE WHEN payroll_year = '2017' THEN payroll_value END) AS "2017",
    MAX(CASE WHEN payroll_year = '2018' THEN payroll_value END) AS "2018",
    MAX(CASE WHEN payroll_year = '2018' THEN payroll_value ELSE 0 END) - SUM(CASE WHEN payroll_year = '2006' THEN payroll_value ELSE 0 END) AS "Diff.", 
    CONCAT(
        ROUND(
            ((MAX(CASE WHEN payroll_year = '2018' THEN payroll_value ELSE 0 END) - 
            MAX(CASE WHEN payroll_year = '2006' THEN payroll_value ELSE 0 END)) / 
            MAX(CASE WHEN payroll_year = '2006' THEN payroll_value ELSE 0 END)) * 100, 0
        ), '%'
    ) AS Growth 
FROM t_jan_rejmont_project_sql_primary_finall22
GROUP BY branch_name;
