CREATE OR REPLACE VIEW vw_sales_base AS
SELECT
    fs.order_number,
    fs.order_date,
    fs.shipping_date,
    fs.due_date,
    fs.sales_amount,
    fs.quantity,
    fs.price,

    dc.customer_key,
    dc.customer_id,
    dc.customer_number,
    dc.first_name,
    dc.last_name,
    dc.gender,
    dc.marital_status,
    dc.country,
    dc.birthdate,
    dc.create_date AS customer_create_date,

    dp.product_key,
    dp.product_id,
    dp.product_number,
    dp.product_name,
    dp.category,
    dp.subcategory,
    dp.product_line,
    dp.cost,
    dp.maintenance,
    dp.start_date AS product_start_date
FROM gold.fact_sales fs
JOIN gold.dim_customers dc
    ON fs.customer_key = dc.customer_key
JOIN gold.dim_products dp
    ON fs.product_key = dp.product_key;

-----KPI Overview
CREATE OR REPLACE VIEW vw_kpi_overview AS
SELECT
    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_units,
    COUNT(DISTINCT order_number) AS total_orders,
    COUNT(DISTINCT customer_key) AS total_customers,
    AVG(price) AS avg_price
FROM vw_sales_base;



----sales monthly
CREATE OR REPLACE VIEW vw_sales_monthly AS
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS monthly_sales,
    SUM(quantity) AS monthly_units
FROM vw_sales_base
GROUP BY month
ORDER BY month;

---Product Performance (RANKING)
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    product_name,
    category,
    SUM(sales_amount) AS total_sales,
    SUM(quantity) AS total_units
FROM vw_sales_base
GROUP BY product_name, category;

--- Country Performance
CREATE OR REPLACE VIEW vw_country_performance AS
SELECT
    country,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS customers,
    SUM(sales_amount) / COUNT(DISTINCT customer_key) AS sales_per_customer
FROM vw_sales_base
GROUP BY country;

---- Category (Part to whole contribution) 

CREATE OR REPLACE VIEW vw_category_share AS
SELECT
    category,
    SUM(sales_amount) AS category_sales,
    SUM(sales_amount) / SUM(SUM(sales_amount)) OVER () AS sales_share
FROM vw_sales_base
GROUP BY category;

---Customer (Segmentation)

CREATE OR REPLACE VIEW vw_customer_segments AS
SELECT
    customer_key,
    country,
    gender,
    SUM(sales_amount) AS lifetime_value,
    CASE
        WHEN SUM(sales_amount) > 10000 THEN 'High Value'
        WHEN SUM(sales_amount) BETWEEN 5000 AND 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM vw_sales_base
GROUP BY customer_key, country, gender;




