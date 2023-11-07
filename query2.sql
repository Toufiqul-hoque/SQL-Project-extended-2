-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 7
-- Description: Run query the first and last names of all customers who have never received a
-- free film rental. Order your results by last name, then first name.

USE sakila;

WITH table_t AS (SELECT COUNT(f.title) AS tcount, cu.first_name, cu.last_name, cu.customer_id
FROM payment p
INNER JOIN customer cu
ON p.customer_id= cu.customer_id
INNER JOIN rental r
ON p.rental_id=r.rental_id
INNER JOIN  inventory i
ON r.inventory_id=i.inventory_id
INNER JOIN film f
ON f.film_id= i.film_id
GROUP BY cu.customer_id
)
SELECT  t.first_name, t.last_name, t.tcount
FROM table_t t
WHERE t.tcount>=20
ORDER BY t.tcount DESC, t.last_name, t.first_name;