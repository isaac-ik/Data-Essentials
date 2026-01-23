SELECT
    DATE_TRUNC('month', f.order_date) AS month,
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY
    month,
    p.category
ORDER BY
    month,
    p.category;




SELECT 
	p.category, 
	SUM(f.sales_amount), 
	DATE_TRUNC('month', f.order_date) AS Month
FROM gold.dim_products p
LEFT JOIN gold.fact_sales f
ON p.product_key = f.product_key
GROUP BY month, category;

