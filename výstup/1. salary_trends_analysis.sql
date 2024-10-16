SELECT 
    industry_name,
    AVG(CASE WHEN year = '2006' THEN payroll_value END) AS "2006",
    AVG(CASE WHEN year = '2007' THEN payroll_value END) AS "2007",
    CASE 
        WHEN AVG(CASE WHEN year = '2007' THEN payroll_value END) > AVG(CASE WHEN year = '2006' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2007",
    AVG(CASE WHEN year = '2008' THEN payroll_value END) AS "2008",
    CASE 
        WHEN AVG(CASE WHEN year = '2008' THEN payroll_value END) > AVG(CASE WHEN year = '2007' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2008",
    AVG(CASE WHEN year = '2009' THEN payroll_value END) AS "2009",
    CASE 
        WHEN AVG(CASE WHEN year = '2009' THEN payroll_value END) > AVG(CASE WHEN year = '2008' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2009",
    AVG(CASE WHEN year = '2010' THEN payroll_value END) AS "2010",
    CASE 
        WHEN AVG(CASE WHEN year = '2010' THEN payroll_value END) > AVG(CASE WHEN year = '2009' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2010",
    AVG(CASE WHEN year = '2011' THEN payroll_value END) AS "2011",
    CASE 
        WHEN AVG(CASE WHEN year = '2011' THEN payroll_value END) > AVG(CASE WHEN year = '2010' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2011",
    AVG(CASE WHEN year = '2012' THEN payroll_value END) AS "2012",
    CASE 
        WHEN AVG(CASE WHEN year = '2012' THEN payroll_value END) > AVG(CASE WHEN year = '2011' THEN payroll_value END) THEN '' 
        ELSE 1
    END AS "Growth_2012",
    AVG(CASE WHEN year = '2013' THEN payroll_value END) AS "2013",
    CASE 
        WHEN AVG(CASE WHEN year = '2013' THEN payroll_value END) > AVG(CASE WHEN year = '2012' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2013",
    AVG(CASE WHEN year = '2014' THEN payroll_value END) AS "2014",
    CASE 
        WHEN AVG(CASE WHEN year = '2014' THEN payroll_value END) > AVG(CASE WHEN year = '2013' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2014",
    AVG(CASE WHEN year = '2015' THEN payroll_value END) AS "2015",
    CASE 
        WHEN AVG(CASE WHEN year = '2015' THEN payroll_value END) > AVG(CASE WHEN year = '2014' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2015",
    AVG(CASE WHEN year = '2016' THEN payroll_value END) AS "2016",
    CASE 
        WHEN AVG(CASE WHEN year = '2016' THEN payroll_value END) > AVG(CASE WHEN year = '2015' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2016",
    AVG(CASE WHEN year = '2017' THEN payroll_value END) AS "2017",
    CASE 
        WHEN AVG(CASE WHEN year = '2017' THEN payroll_value END) > AVG(CASE WHEN year = '2016' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2017",
    AVG(CASE WHEN year = '2018' THEN payroll_value END) AS "2018",
    CASE 
        WHEN AVG(CASE WHEN year = '2018' THEN payroll_value END) > AVG(CASE WHEN year = '2017' THEN payroll_value END) THEN ''  
        ELSE 1
    END AS "Growth_2018",
    (CASE 
        WHEN AVG(CASE WHEN year = '2007' THEN payroll_value END) <= AVG(CASE WHEN year = '2006' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2008' THEN payroll_value END) <= AVG(CASE WHEN year = '2007' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2009' THEN payroll_value END) <= AVG(CASE WHEN year = '2008' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2010' THEN payroll_value END) <= AVG(CASE WHEN year = '2009' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2011' THEN payroll_value END) <= AVG(CASE WHEN year = '2010' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2012' THEN payroll_value END) <= AVG(CASE WHEN year = '2011' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2013' THEN payroll_value END) <= AVG(CASE WHEN year = '2012' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2014' THEN payroll_value END) <= AVG(CASE WHEN year = '2013' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2015' THEN payroll_value END) <= AVG(CASE WHEN year = '2014' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2016' THEN payroll_value END) <= AVG(CASE WHEN year = '2015' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2017' THEN payroll_value END) <= AVG(CASE WHEN year = '2016' THEN payroll_value END) THEN 1 ELSE 0 END +
        CASE 
            WHEN AVG(CASE WHEN year = '2018' THEN payroll_value END) <= AVG(CASE WHEN year = '2017' THEN payroll_value END) THEN 1 ELSE 0 END
    ) AS "CDY",
    MAX(CASE WHEN year = '2018' THEN payroll_value ELSE 0 END) - MAX(CASE WHEN year = '2006' THEN payroll_value ELSE 0 END) AS "Diff.",
    CONCAT(
        ROUND(
            ((AVG(CASE WHEN year = '2018' THEN payroll_value ELSE 0 END) - 
            AVG(CASE WHEN year = '2006' THEN payroll_value ELSE 0 END)) / 
            AVG(CASE WHEN year = '2006' THEN payroll_value ELSE 0 END)) * 100, 0
        ), '%'
    ) AS Growth 
FROM t_jan_rejmont_project_sql_primary_finall
GROUP BY industry_name
ORDER BY CDY DESC;

