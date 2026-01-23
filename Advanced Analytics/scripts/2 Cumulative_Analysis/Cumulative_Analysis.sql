----calculate the total sales per month and the running tital of sales over time

SELECT *
FROM gold.fact_sales;

--MONTHLY BASIS: total sale per month and cumulative month sales

SELECT 
	Month_date,
	SUM(monthly_sale) OVER (
					ORDER BY month_date
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
					) AS cumulative_sales
FROM
	(
		SELECT 
			DATE_TRUNC('month', f.order_date) as Month_date,
			SUM(f.sales_amount) AS monthly_sale
		FROM 
			gold.fact_sales f
		GROUP BY DATE_TRUNC('month', f.order_date)
	);

--- YEARLY BASIS
SELECT 
	year_date,
	yearly_sale,
	SUM(yearly_sale) OVER (
					ORDER BY year_date
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
					) AS cumulative_sales
FROM
	(
		SELECT 
			DATE_TRUNC('year', f.order_date) as year_date,
			SUM(f.sales_amount) AS yearly_sale
		FROM 
			gold.fact_sales f
		GROUP BY DATE_TRUNC('year', f.order_date)
	);

