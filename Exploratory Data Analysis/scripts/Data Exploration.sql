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



--Are some product lines under-represented in sales?