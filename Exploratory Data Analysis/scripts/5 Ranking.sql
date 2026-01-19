-- Top 10 customers by total sales
SELECT c.first_name, c.last_name, SUM(f.sales_amount) AS TotalSales
FROM gold.fact_sales f
RIGHT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY f.customer_key, c.first_name, c.last_name
ORDER BY TotalSales DESC
LIMIT 10;

-- Bottom 10 products by quantity sold
SELECT 
	p.product_name, 
	SUM(CASE 
			WHEN f.quantity IS NOT NULL THEN f.quantity
			ELSE 0
		END
		) AS TotalQuantity
FROM gold.fact_sales f
RIGHT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY TotalQuantity ASC
LIMIT 10;


-- Top 5 countries by revenue

-- Products with the lowest sales despite high price