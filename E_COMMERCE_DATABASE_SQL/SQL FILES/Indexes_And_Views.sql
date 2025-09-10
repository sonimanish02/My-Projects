USE e_commerce;

-- INDEXES

CREATE INDEX prd_name ON products(name);
CREATE INDEX uid_odate ON orders(user_id, order_date);
CREATE INDEX oid_pid ON order_items(order_id, product_id);
CREATE INDEX oid_pm_pms ON payments(order_id, payment_method, payment_status);

SHOW INDEXES FROM products;
SHOW INDEXES FROM orders;
SHOW INDEXES FROM order_items;
SHOW INDEXES FROM payments;

-- VIEWS

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
SELECT products.id As product_id, products.name, SUM(order_items.quantity) AS total_quantity_ordered
FROM products
LEFT JOIN order_items ON products.id = order_items.product_id
GROUP BY products.name
ORDER BY total_quantity_ordered DESC;


-- Revenue per product
CREATE VIEW rev_pr_product AS
SELECT products.id, products.name, SUM(order_items.price * order_items.quantity) AS total_rev
FROM products
LEFT JOIN order_items ON products.id = order_items.product_id
GROUP BY products.name
ORDER BY total_rev ASC;

-- Average order value (AOV)
CREATE VIEW avg_order_v AS
SELECT AVG(total_amount) AS avg_order_value 
FROM orders;

-- Orders per user




