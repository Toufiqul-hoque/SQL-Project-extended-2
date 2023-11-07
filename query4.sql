-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 7
-- Description: Run query the first name, last name, and country for all customers who live in
-- North America (Canada, Mexico, United States). Order your results by country, then last
-- name, then first name.
USE sakila;

SELECT c.first_name, c.last_name,cont.country
FROM customer c
INNER JOIN address a
ON c.address_id=a.address_id
INNER JOIN city ct
ON a.city_id=ct.city_id
INNER JOIN country cont
ON ct.country_id=cont.country_id
WHERE cont.country IN ('Canada','Mexico','United States')
ORDER BY cont.country,c.last_name, c.first_name; 