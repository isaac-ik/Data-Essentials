---- monthly sales trend by category -Method 1
SELECT 
	Category,
	TotalSales,
	MonthD,
	RANK() OVER (PARTITION BY Category ORDER BY MonthD)
FROM (
	SELECT 
			p.category, 
			SUM(f.sales_amount) AS TotalSales, 
			DATE_TRUNC('month', f.order_date) AS MonthD
	FROM gold.dim_products p
	LEFT JOIN gold.fact_sales f
	ON p.product_key = f.product_key
	GROUP BY monthD, category
)
WHERE monthD IS NOT NULL;

----- Method 2

SELECT
    category,
    monthd,
    totalsales,
    totalsales - LAG(totalsales) OVER (PARTITION BY category ORDER BY monthd)
        AS mom_change
FROM (
    SELECT
        p.category,
        DATE_TRUNC('month', f.order_date) AS monthd,
        SUM(f.sales_amount) AS totalsales
    FROM gold.dim_products p
    JOIN gold.fact_sales f
        ON p.product_key = f.product_key
    GROUP BY p.category, monthd
) t
ORDER BY category, monthd;
