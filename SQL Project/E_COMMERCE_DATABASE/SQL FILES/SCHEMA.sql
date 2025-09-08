-- DATABASE CREATION

CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;


-- TABLES CREATION

-- USERS
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email varchar(100) NOT NULL UNIQUE,
    gender ENUM('Male','Female','Other') NOT NULL,
    dob DATE NOT NULL,
    signup_date DATE NOT NULL,
    city VARCHAR(50),
    contact VARCHAR(10)
);

-- PRODUCTS
CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	category VARCHAR(50),
	price DECIMAL(10,2) NOT NULL
);

-- ORDERS
CREATE TABLE orders (
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(12,2),
FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ORDER_ITEMS
CREATE TABLE order_items (
id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

-- PAYMENTS
CREATE TABLE payments (
id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
payment_method ENUM('Credit Card', 'Debit Card', 'UPI', 'PayPal', 'NetBanking', 'COD') NOT NULL,
payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded', 'Cancelled') NOT NULL,
payment_date DATE NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(id)
);

