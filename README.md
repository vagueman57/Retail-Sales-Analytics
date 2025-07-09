# Retail Sales Analytics Project
![SQL Analytics](https://img.shields.io/badge/SQL-Data%20Analytics-blue)

This repository contains SQL scripts for analyzing retail sales data, showcasing advanced SQL skills for data exploration, analytics, and reporting. Inspired by Baraa's YouTube tutorial "SQL Data Analytics Project," it includes enhancements to demonstrate a broader range of analytical techniques and best practices. The scripts help data analysts and BI professionals explore, segment, and derive actionable insights from a relational database.

---

## Project Overview

**Objective:**  
Analyze a retail sales dataset to uncover insights on customer behavior, product performance, and sales trends, using SQL to create reusable reports and metrics.

**Dataset Structure:**
- `fact_sales` (order_number, customer_key, product_key, order_date, sales_amount, quantity)
- `dim_customers` (customer_key, customer_number, first_name, last_name, birthdate)
- `dim_products` (product_key, product_name, category, subcategory, cost)
- `dim_categories` (category_id, category_name)

**Database:**  
SQL Server 

**Skills Demonstrated:**
- Complex SQL queries (joins, aggregations, window functions, CTEs, views)
- Data segmentation and KPI calculation (e.g., recency, average order value)
- Time-series analysis, cumulative metrics, and performance reporting
- Query optimization and documentation best practices

---

## Repository Structure

Scripts are organized by analytical themes:

- **change_over_time_analysis.sql**  
  Analyze sales trends over time (e.g., monthly/quarterly sales, growth rates).

- **cumulative_analysis.sql**  
  Compute cumulative metrics (e.g., running totals by product/category).

- **performance_analysis.sql**  
  Evaluate metrics like total sales, order frequency, and profitability.

- **part_to_whole_analysis.sql**  
  Analyze segment contributions (e.g., share of sales by category).

- **data_segmentation_1.sql**  
  Segment customers by behavior or demographics (e.g., VIP, Regular, New).

- **data_segmentation_2.sql**  
  Segment products by performance (e.g., High-Performer, Mid-Range).

- **gold.report_products.sql**  
  View consolidating product metrics (sales, orders, KPIs, segments).

- **gold.report_customers.sql**  
  View consolidating customer metrics (orders, sales, KPIs, segments).

---

## Enhancements & Best Practices

- **Query Optimization:**  
  - Added `WHERE order_date IS NOT NULL` for performance  
  - Used indexed columns in joins  
  - Leveraged CTEs for modular queries

- **Dynamic Segmentation:**  
  - Dynamic thresholds for segments  
  - Age-based customer segmentation

- **Error Handling:**  
  - Used `NULLIF` to prevent division-by-zero  
  - Safe view creation with `IF OBJECT_ID`

- **Extensibility:**  
  - Scripts adaptable to multiple SQL dialects  
  - Views designed for BI tool integration

- **Business Context:**  
  - KPIs like recency and monthly revenue  
  - Comments explaining business value

---

## Setup Instructions

**Prerequisites:**
- Relational database (SQL Server, MySQL, PostgreSQL, or SQLite)
- SQL client (e.g., DBeaver, SSMS, MySQL Workbench)
- Retail sales dataset (from Kaggle or synthetic)

**Steps:**
1. **Clone the Repository:**  
   `git clone https://github.com/your-username/sql-retail-analytics.git`

2. **Set Up the Database:**  
   - Create a database  
   - Import dataset into tables (CSV or SQL INSERT)  
   - Example (MySQL):
     ```sql
     CREATE TABLE fact_sales (
         order_number INT,
         customer_key INT,
         product_key INT,
         order_date DATE,
         sales_amount DECIMAL(10,2),
         quantity INT
     );
     ```

3. **Run the Scripts:**  
   - Execute scripts in order:  
     `change_over_time_analysis.sql`, `cumulative_analysis.sql`, `performance_analysis.sql`, `part_to_whole_analysis.sql`, `data_segmentation_1.sql`, `data_segmentation_2.sql`, `gold.report_products.sql`, `gold.report_customers.sql`
   - Use a SQL client or command-line tool

4. **Visualize Results:**  
   - Export results to CSV  
   - Create charts in Excel, Google Sheets, Tableau, or Power BI

---

---

## Usage

- Clone the repository and set up the database
- Run SQL scripts in order
- Export results to CSV or visualize in BI tools
- Review `/docs` (if added) for query details

---

## Future Improvements

- Add predictive analytics using SQL or Python
- Implement stored procedures for automated reporting
- Integrate with a web app (e.g., Flask, FastAPI)
- Optimize for large datasets with indexing/partitioning

---

## Acknowledgments

- Inspired by Baraa's SQL Data Analytics Project
- Dataset from Kaggle
- Thanks to open-source tools like DBeaver and Tableau Public

---

## Repository Structure

```
sql-data-analytics-project/
├── scripts/
│   ├── 01_database_setup/        # Schema creation scripts (CREATE TABLE, constraints)
│   ├── 02_data_loading/          # Scripts for importing CSV data into tables
│   ├── 03_basic_analytics/       # Core SQL queries for basic analytics
│   └── 04_advanced_analytics/    # Advanced queries and materialized views
│
├── datasets/                     # Sample data files (CSV format)
│   ├── dim_customers.csv
│   ├── dim_products.csv
│   └── fact_sales.csv
│
└── files/
    ├── ER_Diagram.png            # Entity-Relationship diagram of the schema
    └── Data_Dictionary.md        # Explanations of all fields and tables
```
- **scripts/**: Contains all SQL scripts, organized by workflow stage.
- **datasets/**: Sample CSV data for quick setup and testing.
- **documentation/**: Visual schema and detailed data dictionary for reference.
