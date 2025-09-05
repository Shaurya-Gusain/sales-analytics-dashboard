📊 Oracle Sales Analytics Dashboard
🔹 Project Overview

This project is an end-to-end Sales Analytics solution built with Oracle Database XE, SQL Developer, and Tableau Public.

It demonstrates:

Database design & schema creation

Data loading & transformation (CSV → Oracle tables → analytics view)

SQL queries for business KPIs

Interactive dashboards in Tableau for insights into revenue, products, regions, and customers

🔹 Tech Stack

Oracle Database XE (21c) – Database & schema

SQL Developer – Queries & data import

SQL – Data analysis & KPI extraction

Tableau Public – Visualization & dashboards

(Optional) Java (JDBC ETL) – Automated CSV loading

🔹 Schema Design

Tables created:

Customers (CustomerID, Name, Region)

Products (ProductID, Product, Category, Price)

Sales (SaleID, CustomerID, ProductID, Quantity, SaleDate)

View created:

v_sales_fact → joins all 3 tables for analytics (Revenue = Quantity × Price)

🔹 Analytics Queries

Key SQL queries included in queries_oracle.sql
:

Total Revenue

Monthly Revenue Trend

Top 5 Products by Revenue

Sales by Region

Top 10 Customers (Lifetime Value)

🔹 Tableau Dashboards

The exported query results were visualized in Tableau Public, producing interactive dashboards:

KPI Card → Total Revenue

Line Chart → Monthly Sales Trend

Bar Chart → Sales by Region

Bar Chart → Top 5 Products

Leaderboard → Top 10 Customers

🔹 Key Learnings

Designing schemas for business analytics

Writing SQL queries for KPIs and insights

Connecting databases to BI tools

Building dashboards for decision-making

🔹 How to Run Locally

Install Oracle Database XE (21c).

Create schema sales_analytics.

Run schema_oracle.sql

Import sample data from /data/ CSVs.

Run queries from queries_oracle.sql

Export results → load into Tableau Public → recreate dashboards.
