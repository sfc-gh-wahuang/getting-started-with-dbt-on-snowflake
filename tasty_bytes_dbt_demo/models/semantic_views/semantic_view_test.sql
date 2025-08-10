{{ config(materialized='table') }}

select * from semantic_view(
    {{ ref('tasty_bytes_semantic_view') }}
    METRICS
        total_revenue,
        order_count
    DIMENSIONS
        city,
        brand
)
