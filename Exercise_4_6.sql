--4
SELECT title, replacement_cost, rental_duration
FROM film
WHERE rental_duration BETWEEN 4 AND 6
ORDER BY replacement_cost DESC
LIMIT 100;


SELECT title,description,length,rating 
FROM film
WHERE length > 120
AND rating IN ('G','PG')
AND description LIKE '%Action%';



--6
SELECT first_name,count(*)
FROM actor
GROUP BY first_name;