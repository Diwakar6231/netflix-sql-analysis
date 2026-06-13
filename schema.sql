-- =========================================================================
-- NETFLIX SQL ANALYSIS - SCHEMA & SAMPLE DATA
-- =========================================================================

-- 1. Create the main catalog table
CREATE TABLE netflix_catalog (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(10),
    title VARCHAR(255),
    director VARCHAR(255),
    country VARCHAR(100),
    date_added DATE,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in TEXT
);

-- 2. Insert robust sample data designed to test ALL 5 levels of queries
INSERT INTO netflix_catalog (show_id, type, title, director, country, date_added, release_year, rating, duration, listed_in) VALUES
-- Movies (Varied lengths for CASE statement & AVG calculation)
('m1', 'Movie', 'Inception', 'Christopher Nolan', 'United States', '2020-01-15', 2010, 'PG-13', '148 min', 'Action, Sci-Fi'),
('m2', 'Movie', 'The Irishman', 'Martin Scorsese', 'United States', '2019-11-27', 2019, 'TV-MA', '209 min', 'Biography, Crime, Drama'),
('m3', 'Movie', 'Roma', 'Alfonso Cuarón', 'Mexico', '2018-12-14', 2018, 'R', '135 min', 'Drama'),
('m4', 'Movie', 'Piper', 'Alan Barillaro', 'United States', '2021-05-10', 2016, 'G', '6 min', 'Animation, Short'),
('m5', 'Movie', 'RRR', 'S.S. Rajamouli', 'India', '2022-05-20', 2022, 'TV-14', '187 min', 'Action, Drama'),
('m6', 'Movie', 'The Platform', 'Galder Gaztelu-Urrutia', 'Spain', '2020-03-20', 2019, 'TV-MA', '94 min', 'Horror, Sci-Fi, Thriller'),

-- TV Shows (Varied countries and years for grouping and window functions)
('s1', 'TV Show', 'Stranger Things', 'The Duffer Brothers', 'United States', '2019-07-04', 2016, 'TV-14', '4 Seasons', 'Drama, Fantasy, Horror'),
('s2', 'TV Show', 'Money Heist', 'Álex Pina', 'Spain', '2017-12-20', 2017, 'TV-MA', '5 Parts', 'Crime, Drama, Thriller'),
('s3', 'TV Show', 'Sacred Games', 'Vikramaditya Motwane', 'India', '2018-07-06', 2018, 'TV-MA', '2 Seasons', 'Action, Crime, Drama'),
('s4', 'TV Show', 'Dark', 'Baran bo Odar', 'Germany', '2017-12-01', 2017, 'TV-MA', '3 Seasons', 'Crime, Drama, Mystery'),
('s5', 'TV Show', 'Lupin', 'George Kay', 'France', '2021-01-08', 2021, 'TV-MA', '2 Parts', 'Action, Crime, Drama'),
('s6', 'TV Show', 'The Crown', 'Peter Morgan', 'United Kingdom', '2020-11-15', 2020, 'TV-MA', '4 Seasons', 'Biography, Drama, History');
