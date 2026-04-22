# E-commerce Database (SQL Server + Oracle SQL compatibility)

** 🎯 Project Overview **

This project is a relational e-commerce database built in Microsoft SQL Server, designed to simulate real-world retail data processing and analytics.

In addition, selected queries were adapted and tested for Oracle SQL compatibility using Oracle Live SQL environment.

### Technologies
- Microsoft SQL Server (primary database)
- SQL (T-SQL)
- Oracle SQL (query compatibility layer)
- Tableau (data visualization)
- Window Functions, CTE, Ranking queries

### 🧱 Database Structure

The database contains a fully relational model:
- 8 tables:
 - customers,
 - products,
 - orders,
 - order_items,
 - payments,
 - reviews,
 - categories,
 - inventory
  
- Referential integrity (FK constraints)
- Indexing for performance optimization
- Normalized schema (3NF)

### 📊 Business Analytics Queries

The project focuses on real-world data analysis scenarios:
- Top 10 customers by total spending
- Monthly revenue analysis
- Abandoned cart detection (CTE)
- Product ranking within categories (PARTITION BY)
- Data anomaly detection
- Sales reporting logic via stored procedures

### 🚀 How to Run
- Run 01_schema.sql in SQL Server
- Insert data using 02_insert_data.sql
- Execute analytical queries from 03_queries.sql

### 📸 Screenshots
- folder `screenshots`

### Live Dashboard
👉 [View Dashboard on Tableau Public] https://public.tableau.com/views/E-CommerceSalesDashboard_17768047581190/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
