-----------------------------------------  e_commerce_database_sql_project -------------------------------------------  

USE e_commerce;

-- INDEXES -----------------------------------------------------------------------------------------------------------

CREATE INDEX prd_name ON products(name);
CREATE INDEX uid_odate ON orders(user_id, order_date);
CREATE INDEX oid_pid ON order_items(order_id, product_id);
CREATE INDEX oid_pm_pms ON payments(order_id, payment_method, payment_status);

SHOW INDEXES FROM products;
SHOW INDEXES FROM orders;
SHOW INDEXES FROM order_items;
SHOW INDEXES FROM payments;

-- VIEWS --------------------------------------------------------------------------------------------------------------

-- Users by city
CREATE VIEW users_by_city AS
SELECT city, COUNT(*) AS total_users
FROM users
GROUP BY city
ORDER BY total_users DESC;

-- Age of users
CREATE VIEW age_of_users AS
SELECT name, gender, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM users
ORDER BY age ASC;

-- Top-selling products (by quantity)
CREATE VIEW top_selling_product_q AS
SELECT p.id As product_id, p.name, SUM(oi.quantity) AS total_quantity_ordered
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity_ordered DESC;


-- Revenue per product
CREATE VIEW rev_pr_product AS
SELECT p.id, p.name, SUM(oi.price * oi.quantity) AS total_rev
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_rev ASC;

-- Average order value (AOV)
CREATE VIEW avg_order_v AS
SELECT AVG(total_amount) AS avg_order_value 
FROM orders;

-- Orders per user
CREATE VIEW order_pr_user AS
SELECT u.id AS user_id, u.name AS user_name, COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_orders DESC;

-- Monthly order trend
CREATE VIEW monthly_order_trend AS
SELECT DATE_FORMAT(order_date, '%Y-%m') AS months, COUNT(id) AS total_orders
FROM orders
GROUP BY months
ORDER BY total_orders DESC;

-- Payment method usage
CREATE VIEW payment_method_usage AS
SELECT payment_method, COUNT(*) AS no_of_payments
FROM payments
GROUP BY payment_method
ORDER BY no_of_payments DESC;

-- Payment status breakdown
CREATE VIEW payment_status_breakdown AS
SELECT payment_status, COUNT(*) AS no_of_payments
FROM payments
GROUP BY payment_status
ORDER BY no_of_payments DESC;

-- Top customers by spend
CREATE VIEW top_customers_by_spend AS
SELECT u.id, u.name, SUM(o.total_amount) AS total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_spent DESC;

-- Customer Types
CREATE VIEW customer_type_of_each_user AS
SELECT u.id, u.name, COUNT(o.id) AS total_orders,
	CASE WHEN COUNT(o.id) >= 5 THEN 'Loyal Customer' 
	  WHEN COUNT(o.id) > 1 THEN 'Repeater Buyer' 
	  WHEN COUNT(o.id) = 1 THEN 'One-time Buyer' ELSE 'Non Buyer'
	END AS customer_type
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY u.id ASC;


CREATE VIEW users_by_customer_type AS
SELECT customer_type, COUNT(sub.id) AS total_users
FROM (
	SELECT u.id, u.name, COUNT(o.id) AS total_orders,
		CASE WHEN COUNT(o.id) >= 5 THEN 'Loyal Customer' 
			WHEN COUNT(o.id) > 1 THEN 'Repeater Buyer' 
			WHEN COUNT(o.id) = 1 THEN 'One-time Buyer' ELSE 'Non Buyer'
		END AS customer_type
	FROM users u
	LEFT JOIN orders o ON u.id = o.user_id
	GROUP BY u.id, u.name
		) AS sub
GROUP BY customer_type;


 --------------------------------------------------- END ------------------------------------------------------------                            