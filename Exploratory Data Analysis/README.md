# Exploratory Data Analysis (EDA) — Sales Analytics Dataset

## Overview
This repository contains a structured Exploratory Data Analysis (EDA)
of a relational sales database built using fact and dimension tables.

The purpose of this project is to understand:
- The structure and integrity of the data
- Key dimensions, measures, and time coverage
- How sales performance is distributed across customers, products, and regions

The analysis serves as the foundation for advanced analytics and reporting coming next.



## Logical Data Model

The dataset follows a **star schema** with a central fact table and supporting dimension tables.

- **fact_sales** represents transactional sales records  
  *Grain: one row per product per order*
- **dim_customers** stores customer attributes and demographics
- **dim_products** stores product attributes and classifications

Relationships:
- `fact_sales.customer_key → dim_customers.customer_key`
- `fact_sales.product_key → dim_products.product_key`

The logical data model defines the **analytical grain, join paths, and referential structure** used throughout the EDA.

![Logical Data Model](/scripts/assets/Data model PNG.png)

---

## Project Structure

### 00_setup/
SQL scripts used to create the database, schemas, tables, and load data.
These scripts establish the analytical environment but are not part of the EDA itself.

---

### 01_data_exploration/
**Data_Exploration.sql**

Focus:
- Table relationships and data grain
- Record counts and key coverage
- Initial validation of customer, product, and sales data

---

### 02_measures/
**Measures.sql**

Focus:
- Total sales and total quantity
- Average price and order-level metrics
- High-level “big number” understanding of the dataset

---

### 03_magnitude/
**Magnitude.sql**

Focus:
- Revenue magnitude across customers and products
- Identification of large vs small contributors
- Understanding variability and concentration in sales

---

### 04_ranking/
**Ranking.sql**

Focus:
- Top and bottom performers
- Customer, product, and geographic rankings
- Identification of long-tail and underperforming entities

---

## Dataset Structure

- **fact_sales** — transactional sales data (orders, quantities, revenue)
- **dim_customers** — customer attributes and demographics
- **dim_products** — product attributes and classifications

---

## Tools & Techniques
- SQL (joins, aggregation, ranking, filtering)
- Relational data modeling
- Exploratory analytical framing

---

## Outcome
This EDA establishes:
- Confidence in data quality and structure
- Clear understanding of performance drivers
- A validated base for trend analysis and BI dashboard development

---

## Next Steps
- Change-over-time trend analysis
- Cumulative analytics
- Performance Analysis
- Part-to-Whole Proportional
- Data Segmentation
- Reporting and Power BI reporting
