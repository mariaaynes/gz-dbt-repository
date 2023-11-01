with subquery AS (
    SELECT 
    sales.id,
   sales.date_date,
   sales.orders_id,
   sales.pdt_id,
   sales.revenue,
   sales.quantity,
    CAST(sales.quantity AS INT64) * CAST(products.purchse_price AS FLOAT64) AS purchase_cost,
FROM {{ref ('stg_raw__sales')}} AS sales
JOIN {{ref ('stg_raw__products')}} AS products
ON products.products_id = sales.pdt_id
)

SELECT
    *,
   ROUND(revenue - purchase_cost,2) AS margin
FROM subquery