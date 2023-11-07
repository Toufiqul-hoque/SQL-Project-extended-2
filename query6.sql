-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 7
-- Description: Run query the Select the first names, last names, and total revenue across films of all actors
-- whose first name starts with the letter “N” and where the total revenue is greater than
-- $1750. Order the results by decreasing total revenue
USE sakila;

WITH actors_s AS (SELECT a.actor_id,a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'N%'),

actors_s_a AS (SELECT SUM(p.amount) AS sum_a, s.first_name,s.last_name
FROM payment p
INNER JOIN customer cu
ON p.customer_id= cu.customer_id
INNER JOIN rental r
ON p.rental_id=r.rental_id
INNER JOIN  inventory i
ON r.inventory_id=i.inventory_id
INNER JOIN film f
ON f.film_id= i.film_id
INNER JOIN film_actor fa
ON f.film_id=fa.film_id
INNER JOIN actors_s s
ON s.actor_id=fa.actor_id
GROUP BY s.actor_id
)

SELECT k.first_name, k.last_name, k.sum_a
FROM actors_s_a k
WHERE k.sum_a>1750
ORDER BY k.sum_a DESC, k.last_name, k.first_name;