SELECT * FROM customer
--8
SELECT l.name,f.title,f.rental_rate
FROM film f
INNER JOIN language l
ON f.language_id = l.language_id;


SELECT CONCAT(a.first_name,' ',a.last_name) AS "Actor Name",count(f.film_id) AS "Movies Acted IN"
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
JOIN actor a 
ON fa.actor_id = a.actor_id
GROUP BY a.first_name,a.last_name
ORDER BY count(f.film_id) DESC;


SELECT f.rating,count(f.rating)
FROM film f
LEFT JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r
on i.inventory_id = r.inventory_id
GROUP BY f.rating;



--10
SELECT r.rental_date AS "Rental Date",r.return_date AS "Return Date",
	AGE(r.return_date,r.rental_date) AS "Rent Duration",
	c.first_name,c.last_name,c.email
FROM rental r 
JOIN customer c
ON r.customer_id = c.customer_id
WHERE AGE(r.return_date,r.rental_date) >= INTERVAL '7 days'
ORDER BY "Rent Duration" DESC;


SELECT LENGTH(title),SUBSTR(title,10),SUBSTR(title,15),SUBSTR(title,5,3),SUBSTR(title,5,1)
FROM film;