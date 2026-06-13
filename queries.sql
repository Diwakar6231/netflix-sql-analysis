-- =========================================================================
-- PROJECT: Netflix Content Catalog Analysis (Complete SQL Journey)
-- AUTHOR: [Diwakar]
-- DESCRIPTION: A comprehensive SQL analysis progressing from basic data 
--              retrieval to advanced window functions and CTEs.
-- =========================================================================

-- =======================================================================
-- LEVEL 1: THE BASICS (Retrieving and Filtering Data)
-- Goal: Demonstrate understanding of fundamental SQL clauses.
-- =======================================================================

-- Q1: Preview the dataset (Best practice before writing complex queries)
SELECT * 
FROM netflix_catalog 
LIMIT 10;

-- Q2: Filter data to show only Movies released after 2020
SELECT title, release_year, country
FROM netflix_catalog
WHERE type = 'Movie' AND release_year > 2020
ORDER BY release_year DESC;

-- Q3: Find all content directed by a specific director
SELECT title, type, release_year
FROM netflix_catalog
WHERE director = 'The Duffer Brothers';


-- =======================================================================
-- LEVEL 2: AGGREGATION & GROUPING 
-- Goal: Summarize data to find high-level business metrics.
-- =======================================================================

-- Q4: Count the total number of Movies vs. TV Shows
SELECT 
    type, 
    COUNT(show_id) AS total_titles
FROM netflix_catalog
GROUP BY type
ORDER BY total_titles DESC;

-- Q5: Find the top 5 countries with the most content
SELECT 
    country, 
    COUNT(show_id) AS total_titles
FROM netflix_catalog
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 5;

-- Q6: Count content by Rating (e.g., TV-MA, PG-13)
SELECT 
    rating, 
    COUNT(show_id) AS total_titles
FROM netflix_catalog
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_titles DESC;


-- =======================================================================
-- LEVEL 3: DATA CLEANING & STRING MANIPULATION
-- Goal: Show recruiters you can handle messy, real-world data.
-- =======================================================================

-- Q7: Calculate the average movie runtime in minutes
-- (Cleans the ' min' text and converts the string to an integer)
SELECT 
    ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS INT)), 1) AS avg_movie_runtime_mins
FROM netflix_catalog
WHERE type = 'Movie' AND duration LIKE '%min%';

-- Q8: Handle missing data gracefully using COALESCE
-- (Replaces NULL directors with 'Unknown Director')
SELECT 
    title, 
    COALESCE(director, 'Unknown Director') AS clean_director
FROM netflix_catalog
LIMIT 10;


-- =======================================================================
-- LEVEL 4: INTERMEDIATE LOGIC (CASE Statements & Subqueries)
-- Goal: Demonstrate conditional logic and nested querying.
-- =======================================================================

-- Q9: Categorize movies by length using a CASE statement
SELECT 
    title,
    CAST(REPLACE(duration, ' min', '') AS INT) AS runtime_mins,
    CASE 
        WHEN CAST(REPLACE(duration, ' min', '') AS INT) < 90 THEN 'Short'
        WHEN CAST(REPLACE(duration, ' min', '') AS INT) BETWEEN 90 AND 120 THEN 'Standard'
        ELSE 'Long'
    END AS length_category
FROM netflix_catalog
WHERE type = 'Movie' AND duration LIKE '%min%'
ORDER BY runtime_mins DESC;

-- Q10: Subquery - Find titles released AFTER the average release year of all Netflix content
SELECT title, release_year, type
FROM netflix_catalog
WHERE release_year > (SELECT AVG(release_year) FROM netflix_catalog)
ORDER BY release_year DESC;


-- =======================================================================
-- LEVEL 5: ADVANCED ANALYTICS (CTEs & Window Functions)
-- Goal: Showcase senior-level SQL skills highly sought after by employers.
-- =======================================================================

-- Q11: CTE + RANK() - Find the longest movie for EACH rating category
WITH MovieDurations AS (
    SELECT 
        title,
        rating,
        CAST(REPLACE(duration, ' min', '') AS INT) AS duration_mins
    FROM netflix_catalog
    WHERE type = 'Movie' AND duration LIKE '%min%'
),
RankedMovies AS (
    SELECT 
        title,
        rating,
        duration_mins,
        RANK() OVER(PARTITION BY rating ORDER BY duration_mins DESC) as rank_num
    FROM MovieDurations
)
SELECT rating, title, duration_mins
FROM RankedMovies
WHERE rank_num = 1
ORDER BY duration_mins DESC;

-- Q12: CTE + ROW_NUMBER() - Find the most recently released title per country
WITH RankedByCountry AS (
    SELECT 
        country,
        title,
        release_year,
        ROW_NUMBER() OVER(PARTITION BY country ORDER BY release_year DESC) as row_num
    FROM netflix_catalog
    WHERE country IS NOT NULL
)
SELECT country, title, release_year
FROM RankedByCountry
WHERE row_num = 1
ORDER BY release_year DESC;

-- Q13: Date Extraction & Trend Analysis - Content added per year
SELECT 
    EXTRACT(YEAR FROM date_added) AS year_added,
    COUNT(show_id) AS titles_added
FROM netflix_catalog
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added DESC;
