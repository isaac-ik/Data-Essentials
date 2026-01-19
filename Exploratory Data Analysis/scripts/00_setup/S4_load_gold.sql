-- =====================================================
-- Load GOLD layer tables
-- =====================================================

-- Customers dimension
TRUNCATE TABLE gold.dim_customers;

\copy gold.dim_customers FROM 'C:/Users/Isaac IK/Projects/SQL/EDA/Exploratory Data Analysis/datasets/dim_customers.csv' CSV HEADER;

-- Products dimension
TRUNCATE TABLE gold.dim_products;

\copy gold.dim_products FROM 'C:/Users/Isaac IK/Projects/SQL/EDA/Exploratory Data Analysis/datasets/dim_products.csv' CSV HEADER;

-- Fact sales
TRUNCATE TABLE gold.fact_sales;

\copy gold.fact_sales FROM 'C:/Users/Isaac IK/Projects/SQL/EDA/Exploratory Data Analysis/datasets/fact_sales.csv' CSV HEADER;
