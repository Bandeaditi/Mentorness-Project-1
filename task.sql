--query1:
SELECT 
    CASE WHEN COUNT(*) - COUNT(Province) > 0 THEN 'Yes' ELSE 'No' END AS Province_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Country_Region) > 0 THEN 'Yes' ELSE 'No' END AS Country_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Latitude) > 0 THEN 'Yes' ELSE 'No' END AS Latitude_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Longitude) > 0 THEN 'Yes' ELSE 'No' END AS Longitude_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Date) > 0 THEN 'Yes' ELSE 'No' END AS Date_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Confirmed) > 0 THEN 'Yes' ELSE 'No' END AS Confirmed_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Deaths) > 0 THEN 'Yes' ELSE 'No' END AS Deaths_Null_Exists,
    CASE WHEN COUNT(*) - COUNT(Recovered) > 0 THEN 'Yes' ELSE 'No' END AS Recovered_Null_Exists
FROM corona_data;

--query 3:
SELECT COUNT(*) AS Total_Rows FROM corona_data;

--query 4:
SELECT 
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM corona_data;

--query 5:
SELECT COUNT(DISTINCT DATE_TRUNC('month', Date)) AS Number_Of_Months FROM corona_data;

--query 6:
SELECT 
    DATE_TRUNC('month', Date) AS Month,
    AVG(Confirmed) AS Average_Confirmed,
    AVG(Deaths) AS Average_Deaths,
    AVG(Recovered) AS Average_Recovered
FROM corona_data
GROUP BY DATE_TRUNC('month', Date)
ORDER BY Month;

--query 7:
WITH monthly_data AS (
  SELECT 
    DATE_TRUNC('month', DATE) AS month,
    Confirmed,
    Deaths,
    Recovered
  FROM
    corona_data
)

SELECT
  month,
  MODE() WITHIN GROUP (ORDER BY Confirmed) AS most_frequent_confirmed,
  MODE() WITHIN GROUP (ORDER BY Deaths) AS most_frequent_deaths,
  MODE() WITHIN GROUP (ORDER BY Recovered) AS most_frequent_recovered
FROM
  monthly_data
GROUP BY
  month
ORDER BY
  month;

--query 8:
SELECT 
    DATE_PART('year', Date) AS Year,
    MIN(Confirmed) AS Min_Confirmed,
    MIN(Deaths) AS Min_Deaths,
    MIN(Recovered) AS Min_Recovered
FROM corona_data
GROUP BY DATE_PART('year', Date)
ORDER BY Year;

--query 9:
SELECT 
    DATE_PART('year', Date) AS Year,
    MAX(Confirmed) AS Max_Confirmed,
    MAX(Deaths) AS Max_Deaths,
    MAX(Recovered) AS Max_Recovered
FROM corona_data
GROUP BY DATE_PART('year', Date)
ORDER BY Year;

--query 10:
SELECT 
    DATE_TRUNC('month', Date) AS Month,
    SUM(Confirmed) AS Total_Confirmed,
    SUM(Deaths) AS Total_Deaths,
    SUM(Recovered) AS Total_Recovered
FROM corona_data
GROUP BY DATE_TRUNC('month', Date)
ORDER BY Month;

--query 11:
SELECT 
    SUM(Confirmed) AS Total_Confirmed,
    AVG(Confirmed) AS Average_Confirmed,
    VARIANCE(Confirmed) AS Variance_Confirmed,
    STDDEV(Confirmed) AS StdDev_Confirmed
FROM corona_data;

--query 12:
SELECT 
    DATE_TRUNC('month', Date) AS Month,
    SUM(Deaths) AS Total_Deaths,
    AVG(Deaths) AS Average_Deaths,
    VARIANCE(Deaths) AS Variance_Deaths,
    STDDEV(Deaths) AS StdDev_Deaths
FROM corona_data
GROUP BY DATE_TRUNC('month', Date)
ORDER BY Month;


--query 13:
SELECT 
    SUM(Recovered) AS Total_Recovered,
    AVG(Recovered) AS Average_Recovered,
    VARIANCE(Recovered) AS Variance_Recovered,
    STDDEV(Recovered) AS StdDev_Recovered
FROM corona_data;


--query 14:
SELECT 
    Country_Region,
    SUM(Confirmed) AS Total_Confirmed
FROM corona_data
GROUP BY Country_Region
ORDER BY Total_Confirmed DESC
LIMIT 1;

--query 15:
SELECT 
    Country_Region,
    SUM(Deaths) AS Total_Deaths
FROM corona_data
GROUP BY Country_Region
ORDER BY Total_Deaths ASC
LIMIT 1;


--query 16:
SELECT 
    Country_Region,
    SUM(Recovered) AS Total_Recovered
FROM corona_data
GROUP BY Country_Region
ORDER BY Total_Recovered DESC
LIMIT 5;






