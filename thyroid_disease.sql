
-- Viewing all data and changing to appropriate data types

SELECT * 
FROM thyroid_diff;


ALTER TABLE thyroid_diff 
MODIFY COLUMN Gender VARCHAR(1),
MODIFY COLUMN Smoking VARCHAR(10),
MODIFY COLUMN Pathology VARCHAR(50),
MODIFY COLUMN Focality VARCHAR(50),
MODIFY COLUMN Risk VARCHAR(50),
MODIFY COLUMN Recurred VARCHAR(10);

ALTER TABLE thyroid_diff
RENAME COLUMN `Hx Smoking` to hist_smoking,
RENAME COLUMN `Thyroid Function` to thy_function;

-- Selecting specific data to analyze

SELECT Age, 
		Gender, 
        Smoking, 
        hist_smoking, 
        Pathology, 
        Focality, 
        thy_function, 
        Risk, 
        Recurred
FROM thyroid_diff;

-- Looking at what gender is mainly diagnosed with thyroid disease
-- and calculating their percentage

SELECT Gender,
COUNT(*) as gender_count, 
COUNT(*) * 100.0/ SUM(COUNT(*)) OVER () AS percent
FROM thyroid_diff
GROUP BY Gender;


-- Observing what ages are most impacted by thyroid disease

SELECT Age, 
COUNT(*) AS total_count
FROM thyroid_diff
GROUP BY Age
ORDER BY total_count DESC;

-- Showing the most common types of thyroid disease, finding the average age of diagnosis
-- and the overall percentage of the entire data sample for each pathology type

SELECT Pathology,
AVG(Age) AS avg_age,
COUNT(*) AS total_count,
COUNT(*) * 100.0/ sum(count(*)) OVER () AS percent
FROM thyroid_diff
GROUP BY pathology
ORDER BY avg_age DESC;

-- Observing if smoking is correlated with risk

SELECT Smoking,
COUNT(
CASE 
	WHEN Risk = 'High' 
	THEN 1 ELSE NULL 
END) AS high_risk,
COUNT(
CASE 
	WHEN Risk = 'Intermediate' 
    THEN 1 ELSE NULL 
END) AS intermediate_risk,
COUNT(
CASE 
	WHEN Risk = 'Low' 
    THEN 1 ELSE NULL 
END) AS low_risk
FROM thyroid_diff
GROUP BY Smoking; 

-- Risk percentage of those who do and don't smoke

SELECT Smoking,
COUNT(
CASE 
	WHEN Risk = 'High' 
    THEN 1 ELSE NULL 
END) * 100.0/ SUM(COUNT(*)) OVER () AS high_risk_percent,
COUNT(
CASE 
	WHEN Risk = 'Intermediate' 
    THEN 1 ELSE NULL 
END)* 100.0/ SUM(COUNT(*)) OVER () AS inter_risk_percent,
COUNT(
CASE 
	WHEN Risk = 'Low' 
    THEN 1 ELSE NULL 
END)* 100.0/ SUM(COUNT(*)) OVER () AS low_risk_percent
FROM thyroid_diff
GROUP BY Smoking;

-- Seeing whether patients that do smoke have a higher chance of recurrence

SELECT Age, Smoking, hist_smoking, Recurred
FROM thyroid_diff;

-- Observing active smokers


SELECT Smoking,
COUNT(*) as total_count,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE NULL 
END) AS recurrence,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE NULL 
END)/COUNT(*) * 100 AS recurrence_percent
FROM thyroid_diff
GROUP BY Smoking
ORDER BY recurrence_percent DESC;

-- Observing patients that have had a history of smoking

SELECT hist_smoking,
COUNT(*) as total_count,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE NULL 
END) AS recurrence,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE NULL 
END)/COUNT(*) * 100 AS recurrence_percent
FROM thyroid_diff
GROUP BY hist_smoking
ORDER BY recurrence_percent DESC;

-- Seeing whether thyroid function relates to recurrence

SELECT thy_function, 
COUNT(*) AS total_count,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE 0 
END) AS recurrence,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE 0 
END)/COUNT(*) * 100 AS recurrence_percent
FROM thyroid_diff
GROUP BY thy_function
ORDER BY recurrence_percent DESC;

-- Observing recurrence rates based on pathology and focality

SELECT Pathology, Focality, 
COUNT(*) AS total_count, 
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE 0 
END) AS recurrence,
SUM(
CASE 
	WHEN Recurred = 'Yes' 
    THEN 1 ELSE 0 
END)/COUNT(*) * 100 AS recurrence_percent 
FROM thyroid_diff 
GROUP BY Pathology, Focality
ORDER BY recurrence_percent DESC;




