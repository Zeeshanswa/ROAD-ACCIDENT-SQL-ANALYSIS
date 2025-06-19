--DROPPING TABLE IF EXISTS ROAD ACCIDENT
DROP TABLE IF EXISTS ROAD_ACCIDENTS;

--CREATING TABLE 1
CREATE TABLE ROAD_ACCIDENTS(Accident_ID INT PRIMARY KEY,
Date DATE,
Location TEXT,
Severity TEXT,	
Weather TEXT,
Road_Condition TEXT,
Vehicle_Count INT,	
Casualties INT
);

--COPYING CSV FILE
COPY ROAD_ACCIDENTS(Accident_ID, Date, Location, Severity,	Weather, Road_Condition, 
Vehicle_Count, Casualties)
FROM 'C:\Users\Hp\Downloads\road_accident.csv'
CSV HEADER
DELIMITER ',';

-- Q1: Find total number of fatal accidents
SELECT COUNT(*) AS TOTAL_NUMBER_OF_FATAL_ACCIDENTS FROM ROAD_ACCIDENTS
WHERE SEVERITY = 'Fatal';

--2: Count accidents happened in year 2024
SELECT COUNT(*) FROM ROAD_ACCIDENTS
WHERE EXTRACT(YEAR FROM DATE) = '2024';

--What is the total number of accidents, total casualties, and total vehicles involved BY SEVERITY
SELECT SEVERITY, COUNT(*) AS TOTAL_NUMBER_OF_ACCIDENTS, SUM(CASUALTIES) AS TOTAL_CASUALTIES,
SUM(VEHICLE_COUNT) AS TOTAL_VEHICLE_INVOLVED FROM ROAD_ACCIDENTS
GROUP BY SEVERITY;

-- What is the percentage of accidents that are fatal, severe, and minor?
WITH total AS (SELECT COUNT(*) AS total_accidents FROM ROAD_ACCIDENTS)
SELECT 
    severity,
	COUNT(*) AS accident_count, ROUND(100.0 * COUNT(*) / (SELECT total_accidents FROM total), 2)
AS percentage FROM ROAD_ACCIDENTS
GROUP BY severity;

--Find the weekday on which the most accidents occurred.
SELECT TO_CHAR(date, 'Day') AS weekday, COUNT(*) 
FROM ROAD_ACCIDENTS 
GROUP BY weekday 
ORDER BY COUNT(*) DESC 
LIMIT 1;

--Classify accidents into risk categories based on severity
SELECT accident_id,
   CASE 
      WHEN severity = 'Fatal' THEN 'High Risk'
      WHEN severity = 'Severe' THEN 'Medium Risk'
      ELSE 'Low Risk' END AS risk_level FROM ROAD_ACCIDENTS;

--For each location, calculate running total of accidents (cumulative count)
SELECT location, COUNT(*) OVER(PARTITION BY location ORDER BY date) AS running_total
FROM ROAD_ACCIDENTS;

--: Which reasons caused more than 100 accidents?
SELECT WEATHER, COUNT(*) AS total_accidents
FROM ROAD_ACCIDENTS
GROUP BY WEATHER
HAVING COUNT(*) > 100;