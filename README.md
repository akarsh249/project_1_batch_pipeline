## How to Run

1. Clone the repository:
   git clone https://github.com/akarsh249/project_1_batch_pipeline.git

2. Start PostgreSQL using Docker:
   docker-compose up -d

3. Create staging and clean tables:
   Run SQL files in order from /sql folder

4. Load data:
   python src/ingestion/load_orders.py

5. Run analytics queries:
   Use files in sql/05_analytics_queries.sql
