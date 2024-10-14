SELECT 
    branch_name,
    	MAX(CASE WHEN year = '2006' THEN payroll_value END) AS "2006",
    	MAX(CASE WHEN year = '2007' THEN payroll_value END) AS "2007",
    CASE 
        WHEN MAX(CASE WHEN year = '2007' THEN payroll_value END) > MAX(CASE WHEN year = '2006' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2008' THEN payroll_value END) AS "2008",
    CASE 
        WHEN MAX(CASE WHEN year = '2008' THEN payroll_value END) > MAX(CASE WHEN year = '2007' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2009' THEN payroll_value END) AS "2009",
    CASE 
        WHEN MAX(CASE WHEN year = '2009' THEN payroll_value END) > MAX(CASE WHEN year = '2008' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2010' THEN payroll_value END) AS "2010",
    CASE 
        WHEN MAX(CASE WHEN year = '2010' THEN payroll_value END) > MAX(CASE WHEN year = '2009' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2011' THEN payroll_value END) AS "2011",
    CASE 
        WHEN MAX(CASE WHEN year = '2011' THEN payroll_value END) > MAX(CASE WHEN year = '2010' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2012' THEN payroll_value END) AS "2012",
    CASE 
        WHEN MAX(CASE WHEN year = '2012' THEN payroll_value END) > MAX(CASE WHEN year = '2011' THEN payroll_value END) THEN '' 
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2013' THEN payroll_value END) AS "2013",
    CASE 
        WHEN MAX(CASE WHEN year = '2013' THEN payroll_value END) > MAX(CASE WHEN year = '2012' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2014' THEN payroll_value END) AS "2014",
    CASE 
        WHEN MAX(CASE WHEN year = '2014' THEN payroll_value END) > MAX(CASE WHEN year = '2013' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
   		 MAX(CASE WHEN year = '2015' THEN payroll_value END) AS "2015",
    CASE 
        WHEN MAX(CASE WHEN year = '2015' THEN payroll_value END) > MAX(CASE WHEN year = '2014' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
    	MAX(CASE WHEN year = '2016' THEN payroll_value END) AS "2016",
    CASE 
        WHEN MAX(CASE WHEN year = '2016' THEN payroll_value END) > MAX(CASE WHEN year = '2015' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
   		 MAX(CASE WHEN year = '2017' THEN payroll_value END) AS "2017",
    CASE 
        WHEN MAX(CASE WHEN year = '2017' THEN payroll_value END) > MAX(CASE WHEN year = '2016' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
   		 MAX(CASE WHEN year = '2018' THEN payroll_value END) AS "2018",
    CASE 
        WHEN MAX(CASE WHEN year = '2018' THEN payroll_value END) > MAX(CASE WHEN year = '2017' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "G",
       (CASE 
        WHEN MAX(CASE WHEN year = '2007' THEN payroll_value END) <= MAX(CASE WHEN year = '2006' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2008' THEN payroll_value END) <= MAX(CASE WHEN year = '2007' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2009' THEN payroll_value END) <= MAX(CASE WHEN year = '2008' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2010' THEN payroll_value END) <= MAX(CASE WHEN year = '2009' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2011' THEN payroll_value END) <= MAX(CASE WHEN year = '2010' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2012' THEN payroll_value END) <= MAX(CASE WHEN year = '2011' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2013' THEN payroll_value END) <= MAX(CASE WHEN year = '2012' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2014' THEN payroll_value END) <= MAX(CASE WHEN year = '2013' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2015' THEN payroll_value END) <= MAX(CASE WHEN year = '2014' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2016' THEN payroll_value END) <= MAX(CASE WHEN year = '2015' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2017' THEN payroll_value END) <= MAX(CASE WHEN year = '2016' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN MAX(CASE WHEN year = '2018' THEN payroll_value END) <= MAX(CASE WHEN year = '2017' THEN payroll_value END) THEN 1 ELSE 0 END
    ) AS "CDY",
       MAX(CASE WHEN year = '2018' THEN payroll_value ELSE 0 END) - MAX(CASE WHEN year = '2006' THEN payroll_value ELSE 0 END) AS "Diff.", 
    CONCAT(
        ROUND(
            ((MAX(CASE WHEN year = '2018' THEN payroll_value ELSE 0 END) - 
            MAX(CASE WHEN year = '2006' THEN payroll_value ELSE 0 END)) / 
            MAX(CASE WHEN year = '2006' THEN payroll_value ELSE 0 END)) * 100, 0
        ), '%'
    ) AS Growth 
FROM t_jan_rejmont_project_sql_primary_finall
GROUP BY branch_name
ORDER BY CDY DESC;








