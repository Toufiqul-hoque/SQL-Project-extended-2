-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 7
-- Description: Run query the first and last names of all customers who have never received a
-- free film rental. Order your results by last name, then first name.

USE sakila;

SELECT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id NOT IN (
   SELECT customer_id
	FROM payment 
	WHERE amount =0
	)
	ORDER BY c.last_name,c.first_name;
				