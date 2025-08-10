{{ config(materialized='table') }}

select 
    city,
    brand,
    SUM(order_total) as total_revenue,
    COUNT(DISTINCT order_id) as order_count,
    COUNT(DISTINCT customer_id) as customer_count
from semantic_view(
    {{ ref('tasty_bytes_semantic_view') }}
    FACTS
        order_id,
        order_total,
        customer_id
    DIMENSIONS
        city,
        brand
)
group by city, brand
