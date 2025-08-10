{{ config(materialized='semantic_view') }}

TABLES (
  orders AS {{ ref('orders') }} PRIMARY KEY (order_id, order_detail_id)
)

FACTS (
  orders.order_id as orders.order_id
)

DIMENSIONS (
  orders.primary_city AS orders.city
    WITH SYNONYMS = ('location', 'truck city')
    COMMENT = 'City where the truck operates',

  orders.truck_brand_name AS orders.brand
    WITH SYNONYMS = ('truck brand', 'food brand')
    COMMENT = 'Brand name of the food truck'
)

METRICS (
  orders.total_revenue AS SUM(orders.order_total)
    WITH SYNONYMS = ('revenue', 'sales')
    COMMENT = 'Total revenue from orders',

  orders.order_count AS COUNT(DISTINCT orders.order_id)
    WITH SYNONYMS = ('orders', 'number of orders')
    COMMENT = 'Total number of orders',

  orders.customer_count AS COUNT(DISTINCT orders.customer_id)
    COMMENT = 'Number of unique customers'
)
