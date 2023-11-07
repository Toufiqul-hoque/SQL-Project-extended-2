-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 7
-- Description: Run query the first names, last names, and total amount spent on film rentals of
-- all customers who live in Argentina. Order your results by amount spent (descending),
-- then last name, then first name
USE sakila;

WITH table_t AS (SELECT cu.first_name, cu.last_name, cu.customer_id, SUM(p.amount) AS tcount , cont.country
FROM payment p
INNER JOIN customer cu
ON p.customer_id= cu.customer_id
INNER JOIN rental r
ON p.rental_id=r.rental_id
INNER JOIN  inventory i
ON r.inventory_id=i.inventory_id
INNER JOIN film f
ON f.film_id= i.film_id
INNER JOIN address a
ON cu.address_id=a.address_id
INNER JOIN city ct
ON a.city_id=ct.city_id
INNER JOIN country cont
ON ct.country_id=cont.country_id
GROUP BY cu.customer_id
)

SELECT t.first_name, t.last_name, t.tcount
FROM table_t t
WHERE t.country = 'Argentina'
ORDER BY t.tcount DESC, t.last_name, t.first_name;