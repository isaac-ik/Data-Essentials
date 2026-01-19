/* Objective:
   To Identify the highest-value customers based on total revenue
  
   How I approached this:
   - defined the customer as the unit of analysis(DIMENSION)
   - joined the sales fact table to the customer dimension using RIGHT JOIN
   to retain customer attributes while summing sales amounts.
   - ranked customers by total sales
   - limited to 10.

   Why I think its important:
   - Supports customer prioritization, retention, and segmentation strategies
*/
-- Top 10 customers by total sales
SELECT c.first_name, c.last_name, SUM(f.sales_amount) AS TotalSales
FROM gold.fact_sales f
RIGHT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY f.customer_key, c.first_name, c.last_name
ORDER BY TotalSales DESC
LIMIT 10;

/*
   Objective:
   Identify products with the lowest sales volume/quantities

   How I approached this:
   - Quantity is aggregated by product level
   - RIGHT JOIN ensures all products are considered,
     including those with no recorded sales
   - NULL quantities are turned to zero to reflect
     true lack of demand rather than missing data

   Why this matters:
   - Highlights slow-moving products
   - Identifies Products for promotion, repositioning, or removal from the stores

   
*/

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

/*
	Objective: Top 5 countries by revenue
	
	How I approached this:
	- joined customer data to sales so that revenue would be
	attributed based on customer location
	- aggregated sales at the country level to understand
	geographic revenue distribution
	- ranked countries by total sales to identify the
	strongest-performing regions.

   What this matters:
   - Geographic concentration of revenue
   - Key markets driving overall performance


*/

SELECT c.country, SUM (f.sales_amount) AS TotalSales
FROM gold.dim_customers c
LEFT JOIN gold.fact_sales f
ON f.customer_key = c.customer_key
GROUP BY c.country
ORDER BY TotalSales DESC
LIMIT 5;


-- Products with the lowest sales despite high price _ METHOD 1

SELECT 
	p.product_name, 
	SUM(f.sales_amount) AS TotalSales,
	f.price 
FROM gold.fact_sales f
RIGHT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE f.sales_amount IS NOT NULL
GROUP BY p.product_name, f.price
ORDER BY f.price DESC, TotalSales ASC;

---- METHOD 2
CREATE VIEW product_sales AS (
    SELECT
        p.product_key,
        p.product_name,
        f.price,
        SUM(f.sales_amount) AS total_sales
    FROM gold.dim_products p
    LEFT JOIN gold.fact_sales f
        ON p.product_key = f.product_key
    GROUP BY
        p.product_key,
        p.product_name,
        f.price
);

SELECT
    product_name,
    price,
    total_sales
FROM product_sales
WHERE price >= (
    SELECT PERCENTILE_CONT(0.75)
    WITHIN GROUP (ORDER BY price)
    FROM product_sales
)
ORDER BY total_sales ASC;
