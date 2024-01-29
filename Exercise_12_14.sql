SELECT * FROM payment
--12
SELECT CONCAT(c.first_name,'',c.last_name) AS "Customer Name",
	c.email,SUM(p.amount) AS "Total Rental",
	CASE
		WHEN SUM(p.amount) > 200 Then 'Elite'
		WHEN SUM(p.amount) > 150 AND SUM(p.amount) <= 200 Then 'Platinum'
		WHEN SUM(p.amount) > 100 AND SUM(p.amount) <= 150 Then 'Gold'
		WHEN SUM(p.amount) > 0 AND SUM(p.amount) <= 100 Then 'Silver'
	END
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY "Customer Name",c.email;


CREATE VIEW customer_category AS
SELECT CONCAT(c.first_name,'',c.last_name) AS "Customer Name",
	c.email,SUM(p.amount) AS "Total Rental",
	CASE
		WHEN SUM(p.amount) > 200 Then 'Elite'
		WHEN SUM(p.amount) > 150 AND SUM(p.amount) <= 200 Then 'Platinum'
		WHEN SUM(p.amount) > 100 AND SUM(p.amount) <= 150 Then 'Gold'
		WHEN SUM(p.amount) > 0 AND SUM(p.amount) <= 100 Then 'Silver'
	END
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY "Customer Name",c.email;

SELECT * FROM customer_category



--14
CREATE DATABASE mycommerce;


CREATE TABLE order_details (
  orderid INT PRIMARY KEY,
  customer_name VARCHAR(255),
  product_name VARCHAR(255),
  ordered_from VARCHAR(255),
  order_amount DECIMAL(5,2),
  order_date DATE,
  delivery_date DATE
);


INSERT INTO order_details (orderid, customer_name, product_name, ordered_from, order_amount, order_date, delivery_date) VALUES (1, 'Linda Jones', 'Laptop', 'USA', 899.99, '2024-01-15', '2024-01-22');
INSERT INTO order_details (orderid, customer_name, product_name, ordered_from, order_amount, order_date, delivery_date) VALUES (2, 'Rajesh Kumar', 'Smartphone', 'India', 499.99, '2024-01-16', '2024-01-23');
INSERT INTO order_details (orderid, customer_name, product_name, ordered_from, order_amount, order_date, delivery_date) VALUES (3, 'Pedro Garcia', 'Camera', 'Spain', 299.99, '2024-01-17', '2024-01-24');
INSERT INTO order_details (orderid, customer_name, product_name, ordered_from, order_amount, order_date, delivery_date) VALUES (50, 'Alice Smith', 'Headphones', 'UK', 99.99, '2024-02-03', '2024-02-10');


SELECT product_name,COUNT(orderid) AS "Number of Orders",
		SUM(order_amount) AS "Total Sales"		
FROM order_details
GROUP BY product_name;


ALTER TABLE order_details RENAME COLUMN customer_name TO customer_first_name;


ALTER TABLE order_details ADD COLUMN cancel_date DATE;