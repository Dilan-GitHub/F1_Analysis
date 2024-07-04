-- Lets take a look at the table
SELECT *
FROM F1;

-- What is the average number of laps in a formula 1 race?
SELECT AVG(LAPS) AS average_laps
FROM F1;

-- Has the average number of laps per race changed over time?
SELECT YEAR(DATE) AS year, AVG(LAPS) AS average_laps
FROM F1
GROUP BY YEAR(DATE)
ORDER BY year;

-- How many unique winners there have been through out history
-- Who has won the most races in Formula 1?
-- What is the total number of wins for each winning racer?
SELECT WINNER, COUNT(*) AS wins
FROM F1 
GROUP BY WINNER
ORDER BY wins desc;

-- Wins by manufacturer or racing team through our history of Formula 1
SELECT CAR, COUNT(*) AS vehicle_manufacturer_wins
FROM F1
GROUP BY CAR
ORDER BY vehicle_manufacturer_wins DESC;

-- Get the top 5 manufacturers by the number of wins
WITH TopManufacturers AS (
    SELECT TOP 5 CAR, COUNT(*) AS vehicle_manufacturer_wins
    FROM F1
    GROUP BY CAR
    ORDER BY COUNT(*) DESC
)
SELECT
    F1.CAR,
    FLOOR(CAST(YEAR(F1.DATE) AS FLOAT) / 10) * 10 AS decade,
    COUNT(*) AS wins_per_decade
FROM
    F1
JOIN
    TopManufacturers ON F1.CAR = TopManufacturers.CAR
GROUP BY
    F1.CAR, FLOOR(CAST(YEAR(F1.DATE) AS FLOAT) / 10) * 10
ORDER BY
    F1.CAR, decade;

-- Who was the driver(s) for ferrari in the 2000's
SELECT WINNER, COUNT(*) AS wins
FROM F1
WHERE CAR = 'Ferrari'
  AND YEAR(DATE) BETWEEN 2000 AND 2009
GROUP BY WINNER
ORDER BY wins DESC, WINNER;

-- Who was the driver(s) for ferrari in the 2000's
SELECT WINNER, COUNT(*) AS wins
FROM F1
WHERE CAR = 'Mercedes-benz'
  AND YEAR(DATE) BETWEEN 2010 AND 2019
GROUP BY WINNER
ORDER BY wins DESC, WINNER;

-- How long on average has a Formula 1 race been through out history?
WITH TimeInSeconds AS (
    SELECT 
        (CAST(PARSENAME(REPLACE(TIME, ':', '.'), 3) AS INT) * 3600) +
        (CAST(PARSENAME(REPLACE(TIME, ':', '.'), 2) AS INT) * 60) +
        CAST(PARSENAME(REPLACE(TIME, ':', '.'), 1) AS INT) AS seconds
    FROM 
        F1
)
SELECT 
    RIGHT('0' + CAST(AVG(seconds) / 3600 AS VARCHAR), 2) + ':' +
    RIGHT('0' + CAST((AVG(seconds) % 3600) / 60 AS VARCHAR), 2) + ':' +
    RIGHT('0' + CAST(AVG(seconds) % 60 AS VARCHAR), 2) AS average_time
FROM 
    TimeInSeconds;

-- Find the shortest race
SELECT TOP 1 GRAND_PRIX, WINNER, CAR, LAPS, TIME
FROM F1
ORDER BY TIME ASC;

-- Find the longest race
SELECT TOP 1 GRAND_PRIX, WINNER, CAR, LAPS, TIME
FROM F1
ORDER BY TIME DESC;

-- What venue or location has hosted the most races?
SELECT GRAND_PRIX, COUNT(*) AS race_count
FROM F1
GROUP BY GRAND_PRIX
ORDER BY race_count DESC;

-- Which racer has the most wins at a specific location?
SELECT WINNER, COUNT(*) AS wins
FROM F1 
WHERE GRAND_PRIX = 'Monaco'
GROUP BY WINNER
ORDER BY wins DESC;

-- Which racer and manufacturer combo has the most victories
SELECT WINNER, CAR, COUNT(*) AS wins
FROM F1 
GROUP BY WINNER, CAR
ORDER BY wins DESC;

-- Calculate the number of races per year
SELECT YEAR(DATE) AS year, COUNT(*) AS races_count
FROM F1
GROUP BY YEAR(DATE)
ORDER BY year;
