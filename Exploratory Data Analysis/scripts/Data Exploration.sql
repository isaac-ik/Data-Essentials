SELECT COUNT(*) as Number_of_products
FROM gold.dim_products;

CREATE VIEW NotBought AS(
SELECT p.product_id, p.product_name
FROM gold.dim_products p
LEFT JOIN gold.fact_sales s
ON p.product_id = s.product_key);

SELECT COUNT(*)
FROM NotBought;

SELECT DISTINCT f.product_key
FROM gold.fact_sales f;

SELECT *
FROM gold.dim_products p;

SELECT DISTINCT p.product_id, s.product_key
FROM gold.dim_products p
LEFT JOIN gold.fact_sales s
ON p.product_id = s.product_key
WHERE s.product_key IS NULL;
