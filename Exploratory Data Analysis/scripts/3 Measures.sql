SELECT *
FROM gold.fact_sales;

-- Find the Total Sales
SELECT SUM(sales_amount) AS TotaLSales
FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity)
FROM gold.fact_sales;


-- Find the average selling price
SELECT ROUND(AVG(price), 2) AS AveragePrice
FROM gold.fact_sales;

-- Find the Total number of Orders
SELECT COUNT (DISTINCT order_number)
FROM gold.fact_sales;

--Find the total number of products
SELECT COUNT(product_key) AS TotalProducts
FROM gold.dim_products;


-- Find the total number of customers

SELECT COUNT(customer_id)
FROM gold.dim_customers

-- Find the total number of customers that has placed an order
SELECT COUNT(*) AS totalRows, COUNT(DISTINCT customer_key) AS NOofOrderingCustomers
FROM gold.fact_sales
