USE sakila;

-- 1. Select all the actors with the first name 'Scarlett'
SELECT *
FROM actor
WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
-- How many unique titles are there, and how many films have been rented in total

SELECT COUNT(DISTINCT(title)) AS unique_titles, COUNT(rental_id) AS total_films_rented
FROM film, rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?


SELECT SEC_TO_TIME(ROUND(AVG(length*60),0)) AS 'avg duration' -- TIME_FORMAT(AVG(length), '%T')
FROM film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name))
FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
-- last rental day to first rental day
SELECT
DATEDIFF(MAX(rental_date),MIN(rental_date)) AS operating_days
FROM rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(CONVERT(rental_date,DATE), '%M') AS 'Month', WEEKDAY(CONVERT(rental_date,DATE)) AS 'Weekday'
FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN WEEKDAY(CONVERT(rental_date,DATE)) BETWEEN 0 AND 4 THEN 'workday'
WHEN WEEKDAY(CONVERT(rental_date,DATE)) BETWEEN 5 AND 6 THEN 'weekday'
ELSE 'NO info'
END AS 'day_type'
FROM rental;

-- 9. Get release years.

SELECT DISTINCT(release_year)
FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
Select *
FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title LIKE '% APOLLO';
-- 12. Get 10 the longest films.
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;
-- 13. How many films include Behind the Scenes content?

SELECT COUNT(title) AS 'NO_behind_the_scenes'
FROM film
WHERE special_features LIKE '%Behind the Scenes%';