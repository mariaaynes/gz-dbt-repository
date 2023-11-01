SELECT
  orders.orders_id
  ,orders.date_date
  ,ROUND(orders.margin  + ship.shipping_fee - (ship.logcost + CAST(ship.ship_cost AS FLOAT64)),2) AS operational_margin 
  ,orders.quantity
  ,orders.revenue
  ,orders.purchase_cost
  ,orders.margin
  ,ship.shipping_fee
  ,ship.logcost
  ,ship.ship_cost
FROM {{ref("int_orders_margin")}} orders
LEFT JOIN {{ref("stg_raw__ship")}} ship
	USING(orders_id)
ORDER BY orders_id DESC