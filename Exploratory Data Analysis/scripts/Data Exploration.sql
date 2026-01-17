--Are there products in dim_products that never appear in fact_sales?
SELECT COUNT(p.product_key) AS Number_of_Unsold_categories
FROM gold.dim_products p
LEFT JOIN gold.fact_sales s
ON p.product_key = s.product_key
WHERE s.product_key IS NULL;

--How many customers by country, gender, and marital_status?
SELECT country, COUNT(*)
FROM gold.dim_customers
WHERE country != 'n/a'
GROUP BY country;

SELECT gender, COUNT(*)
FROM gold.dim_customers
WHERE gender != 'n/a'
GROUP BY gender;

SELECT marital_status, COUNT(*)
FROM gold.dim_customers
GROUP BY marital_status;

---Combine into one table 
SELECT 
	'Country' AS Dimension, country, COUNT(*)
FROM 
	gold.dim_customers
WHERE 
	country != 'n/a'
GROUP BY 
	country
UNION ALL
SELECT 
	'Gender' AS Dimension, gender, COUNT(*)
FROM 
	gold.dim_customers
WHERE 
	gender != 'n/a'
GROUP BY 
	gender
UNION ALL
SELECT 
	'Martial Status' AS Dimension, marital_status, COUNT(*)
FROM 
	gold.dim_customers
GROUP BY 
	marital_status;



--How many products per category, subcategory, and product_line?

SELECT 
	'Category' AS Dimension, category, COUNT(*)
FROM 
	gold.dim_products
WHERE category IS NOT NULL
GROUP BY 
	category
UNION ALL
SELECT 
	'Subcategory' AS Dimension, subcategory, COUNT(*)
FROM 
	gold.dim_products
WHERE subcategory IS NOT NULL
GROUP BY 
	subcategory
UNION ALL
SELECT 
	'Product Line' AS Dimension, product_line, COUNT(*)
FROM 
	gold.dim_products
WHERE product_line != 'n/a'
GROUP BY 
	product_line;


--Are some product lines under-represented in sales?

SELECT COUNT( DISTINCT product_line)
FROM gold.dim_products
WHERE product_line != 'n/a'

SELECT 
	p.product_line, SUM(f.quantity) AS TotalQuantity, SUM(f.Sales_amount) AS TotalSales
FROM 
	gold.dim_products p
LEFT JOIN 
	gold.fact_sales f
ON 
	f.product_key = p.product_key
WHERE 
	p.product_line != 'n/a'
GROUP BY 
	p.product_line
ORDER BY 
	TotalSales DESC;
	

