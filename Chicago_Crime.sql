SELECT * FROM `bigquery-public-data.chicago_crime.crime` LIMIT 1000

--Total crimes reported
SELECT
  COUNT (primary_type) as total_crimes
FROM `bigquery-public-data.chicago_crime.crime` LIMIT 1000


--Total type of crimes reported
SELECT
distinct primary_type,
  COUNT (primary_type) as total_crimes
FROM `bigquery-public-data.chicago_crime.crime` 
group by primary_type


--Total crimes reported each year.
SELECT
  year,
  COUNT(primary_type) as total_crime_per_year
  FROM
  `bigquery-public-data.chicago_crime.crime` 
  GROUP BY year
  ORDER BY year

  
--Crime a day
SELECT 
  date_of_crime,
  COUNT(date_of_crime) as crime_a_day
FROM `bigquery-public-data.chicago_crime.crime` 
GROUP BY date_of_crime
ORDER BY date_of_crime

  
--AVG crimes committed everyday
SELECT
AVG(crime_a_day) AS average_crime_per_day
FROM `bigquery-public-data.chicago_crime.crime` 

  
--Creating table with extracted date and time
CREATE TABLE `bigquery-public-data.chicago_crime.crime` 
AS
SELECT
  date,
  EXTRACT(DATE FROM date) as date_of_crime,
  EXTRACT(TIME from date) as time_of_crime,
  primary_type,
  latitude,
  longitude
FROM `bigquery-public-data.chicago_crime.crime` 
ORDER BY date

  
--Looking at totals by primary_type.
SELECT
  primary_type,
  COUNT(primary_type) AS primary_type_total 
FROM `bigquery-public-data.chicago_crime.crime` 
GROUP BY
  primary_type
ORDER BY
  primary_type_total DESC 


  --Looking at percent arrested vs percent not arrested
SELECT
    COUNTIF(arrest) / COUNT(arrest)*100 AS `Percent_Arrested`,
    COUNTIF(NOT arrest) / COUNT(arrest)*100 AS `Percent_Not_Arrested`,
    COUNT(arrest) as total_offenses
FROM `bigquery-public-data.chicago_crime.crime` 


-- Looking at location of thefts
SELECT
  date,
  location,
  primary_type,
  arrest
FROM
  `bigquery-public-data.chicago_crime.crime` 
WHERE
  primary_type = 'THEFT'
  AND location IS NOT NULL


--Looking AT location of batteries
SELECT
  date,
  location,
  primary_type,
  arrest
FROM
  `bigquery-public-data.chicago_crime.crime` 
WHERE
  primary_type = 'BATTERY'
  AND location IS NOT NULL


--Looking AT location OF criminal damages
SELECT
  date,
  location,
  primary_type,
  arrest
FROM
  `bigquery-public-data.chicago_crime.crime` 
WHERE
  primary_type = 'CRIMINAL DAMAGE'
  AND location IS NOT NULL 


  --Looking AT location OF narcotics
SELECT
  date,
  location,
  primary_type,
  arrest
FROM
  `bigquery-public-data.chicago_crime.crime` 
WHERE
  primary_type = 'NARCOTICS'
  AND location IS NOT NULL
