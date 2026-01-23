# PROJECT DESCRIPTION: ADVANCED ANALYTICS
## Overview

This repository demonstrates **advanced analytical thinking using SQL**, moving beyond basic aggregation to answer:

- how performance changes over time  
- how value accumulates  
- where performance deviates from expectations  
- what contributes most to overall results  
- how data can be segmented for decision-making  

The project follows a **structured analytics framework**, progressing from trends to cumulative behavior, performance benchmarking, proportional analysis, segmentation, and reporting.

All analyses are implemented in **PostgreSQL** using:
- window functions
- analytical aggregates
- ranking and segmentation logic
- business-oriented query design

---

## Analytics Framework

> **Advanced Analytics answers:**  
> *“How is performance evolving, why is it happening, and how can we act?”*

---

## 1. Change-Over-Time Trends  
**(Direction & Momentum)**

### Business Questions
- Are sales increasing, decreasing, or flat over time?
- Are trends consistent across categories or regions?

### SQL Techniques Used
- `DATE_TRUNC()`
- `SUM()`
- `LAG()`
- Window functions with `OVER`, `PARTITION BY`, `ORDER BY`

### Example Analyses
- Monthly sales trend by category  
- Year-over-year sales growth  
- Trend of average order value over time  

---

## 2. Cumulative Analysis  
**(Progress Toward Totals)**

### Business Questions
- How does value accumulate over time?
- When are major milestones reached?

### SQL Techniques Used
- `SUM() OVER (ORDER BY ...)`
- Cumulative window frames
- Time-based ordering

### Example Analyses
- Cumulative sales by year  
- Cumulative quantity sold by category  
- Revenue accumulation by customer group  
