-- Drop existing objects if they exist (ignore errors if not present)
BEGIN EXECUTE IMMEDIATE 'DROP VIEW v_sales_fact'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Sales'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Products'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customers'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Customers table
CREATE TABLE Customers (
  CustomerID NUMBER PRIMARY KEY,
  Name       VARCHAR2(100) NOT NULL,
  Region     VARCHAR2(50)  NOT NULL
);

-- Products table
CREATE TABLE Products (
  ProductID NUMBER PRIMARY KEY,
  Product   VARCHAR2(100) NOT NULL,
  Category  VARCHAR2(50)  NOT NULL,
  Price     NUMBER(10,2)  NOT NULL CHECK (Price >= 0)
);

-- Sales table
CREATE TABLE Sales (
  SaleID     NUMBER PRIMARY KEY,
  CustomerID NUMBER NOT NULL,
  ProductID  NUMBER NOT NULL,
  Quantity   NUMBER NOT NULL CHECK (Quantity > 0),
  SaleDate   DATE   NOT NULL,
  CONSTRAINT fk_sales_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  CONSTRAINT fk_sales_product  FOREIGN KEY (ProductID)  REFERENCES Products(ProductID)
);

-- Helpful indexes
CREATE INDEX idx_sales_date ON Sales (SaleDate);
CREATE INDEX idx_customers_region ON Customers (Region);

-- Convenience view to analyze joined data
CREATE OR REPLACE VIEW v_sales_fact AS
SELECT
  s.SaleID,
  s.SaleDate,
  c.CustomerID,
  c.Name AS CustomerName,
  c.Region,
  p.ProductID,
  p.Product,
  p.Category,
  p.Price,
  s.Quantity,
  (s.Quantity * p.Price) AS Revenue
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products  p ON s.ProductID  = p.ProductID;
