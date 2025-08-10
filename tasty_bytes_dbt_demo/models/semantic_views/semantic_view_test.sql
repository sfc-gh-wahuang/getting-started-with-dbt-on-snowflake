{{ config(materialized='table') }}

select * from semantic_view(
    {{ ref('tasty_bytes_semantic_view') }}
    METRICS
        orders.total_revenue,
        orders.order_count
    DIMENSIONS
        orders.city,
        orders.brand,
        orders.order_timestamp
)
