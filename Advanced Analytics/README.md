Project Description
Advanced Analytics with SQL
Overview

This project demonstrates advanced analytical thinking using SQL, moving beyond basic aggregation to answer why performance changes, how value accumulates, and where action should be taken.

The analysis follows a systematic analytics framework, progressing from time-based trends to cumulative behavior, performance benchmarking, proportional contribution, segmentation, and decision-ready reporting.

All analyses are implemented in PostgreSQL using:

window functions

analytical aggregates

ranking and segmentation logic

business-oriented query design

Analytics Framework

Advanced Analytics answers:
“How is performance evolving, why is it happening, and how can we act?”

1. Change-Over-Time Trends

(Direction & Momentum)

Business Questions

Are sales increasing, decreasing, or flat over time?

Are trends consistent across categories or regions?

Techniques Used

DATE_TRUNC

SUM()

window functions (OVER, PARTITION BY, ORDER BY)

Dataset Examples

Monthly sales trend by category

Year-over-year growth in total sales


2. Cumulative Analysis

(Progress Toward Totals)

Business Questions

How does value accumulate over time?

When are major milestones reached?

Techniques Used

SUM() OVER (ORDER BY …)

cumulative window frames

time-based ordering

Dataset Examples

Cumulative sales by year

Cumulative quantity sold by category

Revenue accumulation by top customers vs others
