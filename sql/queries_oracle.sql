--------------------------------------------------------------------------------
-- Analytics Queries for Sales Analytics Project
-- Schema: sales_analytics
--------------------------------------------------------------------------------

-- 1. Total Revenue
SELECT SUM(Revenue) AS TotalRevenue
FROM v_sales_fact;

--------------------------------------------------------------------------------

-- 2. Monthly Revenue Trend
SELECT TO_CHAR(SaleDate, 'YYYY-MM') AS Month,
       SUM(Revenue) AS Revenue
FROM v_sales_fact
GROUP BY TO_CHAR(SaleDate, 'YYYY-MM')
ORDER BY Month;

--------------------------------------------------------------------------------

-- 3. Top 5 Products by Revenue
SELECT Product,
       SUM(Revenue) AS Revenue
FROM v_sales_fact
GROUP BY Product
ORDER BY Revenue DESC
FETCH FIRST 5 ROWS ONLY;

--------------------------------------------------------------------------------

-- 4. Sales by Region
SELECT Region,
       SUM(Revenue) AS Revenue
FROM v_sales_fact
GROUP BY Region
ORDER BY Revenue DESC;

--------------------------------------------------------------------------------

-- 5. Top 10 Customers by Lifetime Value
SELECT CustomerID,
       CustomerName,
       SUM(Revenue) AS LifetimeValue
FROM v_sales_fact
GROUP BY CustomerID, CustomerName
ORDER BY LifetimeValue DESC
FETCH FIRST 10 ROWS ONLY;

--------------------------------------------------------------------------------
-- End of queries_oracle.sql
--------------------------------------------------------------------------------
