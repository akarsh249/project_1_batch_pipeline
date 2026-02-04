# Batch Data Pipeline – PostgreSQL + Python

## Overview
This project demonstrates an end-to-end **batch data pipeline** built using **Python, PostgreSQL, Docker, and SQL**.

The pipeline ingests raw CSV data, loads it into a staging layer, applies cleaning and data quality rules, and transforms it into an analytics-ready **star schema**. The final layer supports business intelligence and reporting queries.

This project simulates a real-world data engineering workflow used in production environments.

---

## Architecture

Raw CSV  
**Staging Layer** (`staging`)  
**Clean Layer** (`clean`)  
**Quality Enforced Layer** (`clean.orders_strict`)  
**Analytics Layer** (`analytics`)



---

## Tech Stack

- Python (pandas, SQLAlchemy)
- PostgreSQL
- Docker
- pgAdmin
- SQL
- Git / GitHub

---

## Data Model (Star Schema)

### Fact Table
- `analytics.fact_orders`

### Dimension Tables
- `analytics.dim_customers`
- `analytics.dim_products`

This dimensional model enables fast and simple business analytics.

---

## Pipeline Steps

### Data Ingestion (Python)
- Loads raw CSV using pandas
- Normalizes column names
- Inserts data into `staging.stg_orders`

### Data Cleaning (SQL)
- Converts text columns to proper types
- Handles missing values
- Creates `clean.orders`

### Data Quality Checks (SQL)
- Removes duplicates
- Validates numeric ranges
- Enforces rules in `clean.orders_strict`

### Dimensional Modeling (SQL)
- Builds fact and dimension tables
- Creates analytics schema

### Analytics Queries (SQL)
- Top products by profit
- Sales by region
- Monthly sales trends
- Top customers by revenue

---

## How to Run (High Level)

1. Start PostgreSQL using Docker
2. Run Python ingestion script
3. Execute SQL scripts in order using pgAdmin:
    01_create_staging.sql
    02_create_clean_orders.sql
    03_data_quality_checks.sql
    04_dims_facts.sql
    05_analytics_queries.sql
4. Run analytics queries in pgAdmin



---

## Project Structure

project_1_batch_pipeline/
│
├── src/
│ └── ingestion/
│ └── load_orders.py
│
├── sql/
│ ├── 01_create_staging.sql
│ ├── 02_create_clean_orders.sql
│ ├── 03_data_quality_checks.sql
│ ├── 04_dims_facts.sql
│ └── 05_analytics_queries.sql
│
├── docker/
│ └── docker-compose.yml
│
├── README.md
├── requirements.txt
└── .gitignore



---

## Notes

- Raw CSV files are excluded from this repository using `.gitignore`
- This project follows industry-style ETL layering
- Designed for portfolio and interview demonstration

---

## Learning Outcomes

Through this project, I learned:

- Building batch data pipelines
- Using PostgreSQL in Docker
- Writing production-style SQL transformations
- Implementing data quality checks
- Designing star schemas
- Supporting business analytics

---

## Author

**Akarsh Thota**  
Master’s in Management Information Systems  
Aspiring Data Engineer / Analytics Engineer


