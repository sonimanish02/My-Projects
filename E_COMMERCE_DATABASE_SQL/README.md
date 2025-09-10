# E-Commerce Database SQL Project



This repository operationalizes an end-to-end e-commerce database — from schema design to data population to advanced analytics. It’s engineered to demonstrate how a transactional system can be turned into an analytical powerhouse using indexes, views, and Python-based automation.



##### 1\. Project Overview



* Objective: Build a production-grade, normalized e-commerce database with transactional and analytical capabilities.
* Scope: Covers schema design, synthetic data generation, indexing for performance, and analytical views for insights.
* Tech Stack: MySQL 8.x, Python 3.x (Faker, mysql.connector), SQL scripts for schema, views, and indexing.



##### 2\. Repository Structure



* SCHEMA.sql – Creates the entire database schema (Users, Products, Orders, Order Items, Payments).
* Python script for data insertion.PY – Populates the database with synthetic but realistic data using Faker.
* INDEXES.sql - Creates indexes for performance.
* VIEWS.sql – Creates analytical views for insights.
* ANALYSIS\_USING\_VIEWS.sql – Run-time queries to extract business intelligence from views.
* VIEW\_ALL\_TABLES\_AT\_ONCE.sql – Utility script to snapshot all tables simultaneously.
* er\_diagram.jpg – Visual entity-relationship diagram for schema reference.



##### 3\. Core Features



* Normalized schema following best-practice constraints.
* Synthetic data generator capable of creating thousands of records programmatically.
* Optimized indexes to accelerate common join and filter operations.



###### Analytical views for instant dashboards:



* Users by City
* Age Segmentation
* Top-Selling Products
* Revenue per Product
* Average Order Value
* Monthly Order Trend
* Payment Method \& Status Distribution
* Customer Segmentation (Loyal / Repeater / One-Time / Non-Buyer)
