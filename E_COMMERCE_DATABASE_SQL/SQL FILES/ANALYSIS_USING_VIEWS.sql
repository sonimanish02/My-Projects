-----------------------------------------  e_commerce_database_sql_project -------------------------------------------  

USE e_commerce;

-- ANALYSIS USING VIEWS -------------------------------------------------------------------------------------------


-- Users by city
SELECT * FROM users_by_city;

-- Age of users
SELECT * FROM age_of_users;
SELECT * FROM age_of_users WHERE gender = 'Male' AND age BETWEEN 18 AND 30 ;

-- Top-selling products (by quantity)
SELECT * FROM top_selling_product_q;
SELECT * FROM top_selling_product_q WHERE total_quantity_ordered BETWEEN 30 AND 40;

-- Revenue per product
SELECT * FROM rev_pr_product;
SELECT * FROM rev_pr_product WHERE total_rev > 1500000;
SELECT * FROM rev_pr_product WHERE name = 'OnePlus 11';

-- Average order value (AOV)
SELECT * FROM avg_order_v;

-- Orders per user
SELECT * FROM order_pr_user;
SELECT * FROM order_pr_user WHERE total_orders < 3;

-- Monthly order trend
SELECT * FROM monthly_order_trend;
SELECT * FROM monthly_order_trend WHERE total_orders < 20;

-- Payment method usage
SELECT * FROM payment_method_usage;

-- Payment status breakdown
SELECT * FROM payment_status_breakdown;

-- Top customers by spend
SELECT * FROM top_customers_by_spend;
SELECT * FROM top_customers_by_spend WHERE total_spent > 500000;

-- Customer Types
SELECT * FROM customer_type_of_each_user;
SELECT * FROM customer_type_of_each_user WHERE customer_type = 'Loyal Customer';

SELECT * FROM users_by_customer_type;


 --------------------------------------------------- END ------------------------------------------------------------                            