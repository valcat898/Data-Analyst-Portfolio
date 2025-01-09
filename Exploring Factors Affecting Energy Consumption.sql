-- DATA PREPARATION 
-- Ensure that data was imported correctly.
SELECT * FROM energy_data;

-- DATA CLEANING

-- Duplicates were removed in Excel, but we will double check.
SELECT DISTINCT building_type, sq_footage, num_occupants, num_appliances, avg_temp, day_of_week, energy_consumption
INTO energy_data_clean
FROM energy_data;

SELECT * FROM energy_data_clean;

-- Find missing data in table. 
SELECT *
FROM energy_data_clean
WHERE building_type IS NULL
OR sq_footage IS NULL
OR num_occupants IS NULL
OR num_appliances IS NULL 
OR avg_temp IS NULL
OR day_of_week IS NULL 
OR energy_consumption IS NULL;

-- EXPLORATORY DATA ANALYSIS 

-- Shows total energy consumption by building type.
SELECT building_type, SUM(energy_consumption) AS total_consumption
FROM energy_data_clean
GROUP BY building_type;

-- Shows average energy consumption by day of the week.
SELECT day_of_week, SUM(energy_consumption) AS avg_consumption
FROM energy_data_clean
GROUP BY day_of_week; 

-- Shows energy consumption vs temperature and groups avg_temp as ranges.
SELECT 
	CASE
		WHEN avg_temp BETWEEN 10 AND 15.50 THEN '10-15'
		WHEN avg_temp BETWEEN 15.51 AND 19.50 THEN '16-20'
		WHEN avg_temp BETWEEN 19.51 AND 25.5 THEN '21-25'
		WHEN avg_temp BETWEEN 25.51 AND 30.5 THEN '26-30'
		WHEN avg_temp BETWEEN 30.51 AND 35.5 THEN '31-35'
	END AS temp_range,
	AVG(energy_consumption) AS average_consumption
FROM energy_data_clean
GROUP BY 
	CASE 
		WHEN avg_temp BETWEEN 10 AND 15.50 THEN '10-15'
		WHEN avg_temp BETWEEN 15.51 AND 19.50 THEN '16-20'
		WHEN avg_temp BETWEEN 19.51 AND 25.5 THEN '21-25'
		WHEN avg_temp BETWEEN 25.51 AND 30.5 THEN '26-30'
		WHEN avg_temp BETWEEN 30.51 AND 35.5 THEN '31-35'
	END
ORDER BY temp_range;

-- Shows energy consumption by square footage and number of occupants. 
SELECT sq_footage, num_occupants, AVG(energy_consumption) as avg_consumption 
FROM energy_data_clean
GROUP BY sq_footage, num_occupants
ORDER BY 2;

-- Shows energy consumption based on appliances used. 
SELECT num_appliances, AVG(energy_consumption) as avg_consumption
FROM energy_data_clean
GROUP BY num_appliances
ORDER BY 1;

-- Shows building type and temperature correlation. 
SELECT building_type, AVG(avg_temp) AS avg_temp, AVG(energy_consumption) as avg_consumption
FROM energy_data_clean
GROUP BY building_type;

-- Shows energy efficiency by square footage and number of occumpants. 
SELECT sq_footage, num_occupants, (AVG(energy_consumption) / sq_footage) as efficiency
FROM energy_data_clean
GROUP BY sq_footage, num_occupants;