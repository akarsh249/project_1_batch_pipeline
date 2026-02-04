CREATE SCHEMA IF NOT EXISTS clean;

DROP TABLE IF EXISTS clean.orders;

CREATE TABLE clean.orders AS
SELECT
  NULLIF(TRIM(row_id), '')         AS row_id,
  NULLIF(TRIM(order_id), '')       AS order_id,

  -- Superstore dates are usually like 11/8/2016 (MM/DD/YYYY)
 TO_DATE(NULLIF(TRIM(order_date), ''), 'DD-MM-YYYY') AS order_date,
TO_DATE(NULLIF(TRIM(ship_date), ''),  'DD-MM-YYYY') AS ship_date,

  NULLIF(TRIM(ship_mode), '')      AS ship_mode,
  NULLIF(TRIM(customer_id), '')    AS customer_id,
  NULLIF(TRIM(customer_name), '')  AS customer_name,
  NULLIF(TRIM(segment), '')        AS segment,

  NULLIF(TRIM(country), '')        AS country,
  NULLIF(TRIM(city), '')           AS city,
  NULLIF(TRIM(state), '')          AS state,
  NULLIF(TRIM(postal_code), '')    AS postal_code,
  NULLIF(TRIM(region), '')         AS region,

  NULLIF(TRIM(product_id), '')     AS product_id,
  NULLIF(TRIM(category), '')       AS category,
  NULLIF(TRIM(sub_category), '')   AS sub_category,
  NULLIF(TRIM(product_name), '')   AS product_name,

  NULLIF(TRIM(sales), '')::NUMERIC     AS sales,
  NULLIF(TRIM(quantity), '')::INTEGER  AS quantity,
  NULLIF(TRIM(discount), '')::NUMERIC  AS discount,
  NULLIF(TRIM(profit), '')::NUMERIC    AS profit

FROM staging.stg_orders;
