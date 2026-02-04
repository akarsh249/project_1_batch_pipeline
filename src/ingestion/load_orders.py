
import pandas as pd
from sqlalchemy import create_engine

CSV_PATH = r"data/raw/orders.csv"
DB_URL = "postgresql+psycopg2://de_user:de_pass@localhost:5432/de_db"

def normalize_columns(df):
    df.columns = (
        df.columns
        .str.strip()
        .str.lower()
        .str.replace(" ", "_", regex=False)
        .str.replace("-", "_", regex=False)
    )
    return df

def main():
    df = pd.read_csv(CSV_PATH, encoding_errors="ignore")
    df = normalize_columns(df)

    engine = create_engine(DB_URL)
    df.to_sql(
        name="stg_orders",
        con=engine,
        schema="staging",
        if_exists="append",
        index=False,
        chunksize=1000,
        method="multi"
    )

    print(f"✅ Loaded {len(df)} rows into staging.stg_orders")

if __name__ == "__main__":
    main()
