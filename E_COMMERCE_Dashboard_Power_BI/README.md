# E-Commerce Dashboard



This project delivers a data visualization layer on top of the existing e-commerce MySQL database. Built as a standalone dashboard, it converts raw transactional data into actionable insights for decision-makers.



###### 1\. Project Overview



* Objective: Transform the e-commerce database into a live, interactive dashboard that highlights key KPIs and customer behavior.
* Scope: Visualizes customer segmentation, sales trends, revenue performance, and payment analytics.
* Tech Stack: Power BI / Tableau / Excel / or any BI tool (depending on your actual build) connected to MySQL database.





###### 2\. Key Features



* Customer Segmentation: Total customers by customer type (Loyal, Repeater, One-time, Non-Buyer).
* Gender Split: Real-time breakdown of customers by gender.
* Sales Trends: Total orders by month across 2024–2025.
* Revenue Insights: Average Order Value, Total Revenue, Total Orders, Total Quantity Sold.
* Payment Analytics: Payment status breakdown (Completed, Failed, Cancelled, Pending, Refunded).
* Transaction Channels: Total transactions segmented by payment method (Credit Card, UPI, Debit Card, NetBanking, PayPal, COD).
* Category \& Product Filters: Drill-down by category or product name for granular insights.



###### 3\. Dashboard Components



* Filters \& Slicers: Year, Month, Product Category, Product Name.
* Visuals: Bar charts, donut charts, KPI cards.
* Metrics: AOV, total revenue, order count, payment performance.



###### 4\. How It Works



* Connect to MySQL Database: Use the same e\_commerce schema created previously.
* Extract Data: Load tables or views directly from MySQL into your BI tool.
* Transform \& Model: Apply relationships between tables (Users, Orders, Payments, Products).
* Build Visuals: Implement charts and KPIs shown in the screenshot.



###### 5\. Example KPIs



* Average Order Value: ₹72.03K
* Total Revenue: ₹21.61M
* Total Orders: 300
* Total Quantity Sold: 2K



###### 6\. Forward Roadmap



* Embed real-time refresh using MySQL triggers or APIs.
* Add customer lifetime value and churn prediction visuals.
* Integrate with email / marketing tools to trigger campaigns from dashboard insights.
