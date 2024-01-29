SELECT customer_id , amount
FROM payment
WHERE amount >= 7.99;

SELECT title AS "Movie Name", rental_rate AS "Rental Cost",
		replacement_cost AS "Replacement cost"
FROM film
WHERE rental_rate > 2.99 OR replacement_cost > 19.99;