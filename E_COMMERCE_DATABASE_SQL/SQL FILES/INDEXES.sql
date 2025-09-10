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


 --------------------------------------------------- END ------------------------------------------------------------                            