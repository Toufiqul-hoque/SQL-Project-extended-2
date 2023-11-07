-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 7
-- Description: Run query the Select the first name, last name, and amount spent for all customers who
-- have spent between $100 and $200 on films. Order your results by amount spent
-- (descending), then last name, then first name.
USE sakila;

WITH table_t AS (SELECT cu.first_name, cu.last_name, cu.customer_id, SUM(p.amount) AS tcount
FROM payment p
INNER JOIN customer cu
ON p.customer_id= cu.customer_id
GROUP BY cu.customer_id
)
SELECT t.first_name, t.last_name, t.tcount
FROM table_t t
WHERE t.tcount>100 AND t.tcount <200
ORDER BY t.tcount DESC, t.last_name, t.first_name;