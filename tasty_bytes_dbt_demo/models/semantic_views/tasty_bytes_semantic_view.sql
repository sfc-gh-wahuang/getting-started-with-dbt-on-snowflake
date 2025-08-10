{{ config(materialized='semantic_view') }}

TABLES (
  orders AS {{ ref('orders') }} PRIMARY KEY (order_id, order_detail_id)
)

FACTS (
  orders.order_id as order_id,
  orders.order_total as order_total,
  orders.customer_id as customer_id
)

DIMENSIONS (
  orders.primary_city AS city
    WITH SYNONYMS = ('location', 'truck city')
    COMMENT = 'City where the truck operates',

  orders.truck_brand_name AS brand
    WITH SYNONYMS = ('truck brand', 'food brand')
    COMMENT = 'Brand name of the food truck'
)
