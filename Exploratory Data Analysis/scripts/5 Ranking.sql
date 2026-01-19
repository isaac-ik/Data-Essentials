-- Top 10 customers by total sales
SELECT c.first_name, c.last_name, SUM(f.sales_amount) AS TotalSales
FROM gold.fact_sales f
RIGHT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY f.customer_key, c.first_name, c.last_name
ORDER BY TotalSales DESC
LIMIT 10;
-- Bottom 10 products by quantity sold

-- Top 5 countries by revenue

-- Products with the lowest sales despite high price