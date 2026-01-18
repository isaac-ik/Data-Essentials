SELECT *
FROM gold.fact_sales;

-- Find the Total Sales
SELECT SUM(sales_amount) AS TotaLSales
FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity)
FROM gold.fact_sales;


-- Find the average selling price

-- Find the Total number of Orders

--Find the total number of products

-- Find the total number of customers

-- Find the total number of customers that has placed an order
