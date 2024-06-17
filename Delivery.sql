SELECT
 DATE(DATE_TRUNC(order_purchase_timestamp, WEEK)) AS purchase_week,
 AVG(TIMESTAMP_DIFF(order_approved_at, order_purchase_timestamp, HOUR)) AS hours_to_approve,
 AVG(DATE_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY)) AS days_to_deliver,
 AVG(DATE_DIFF(order_estimated_delivery_date, order_delivered_customer_date, DAY)) AS days_estimated_vs_actual,
 order_estimated_delivery_date AS delivery_estimate,
 order_delivered_carrier_date AS carrier_date, 
 order_delivered_customer_date AS delivered,
 AVG(DATE_DIFF(order_delivered_carrier_date, order_purchase_timestamp, DAY)) AS days_to_ship
FROM `tc-da-1.olist_db.olist_orders_dataset`
WHERE
 order_status = 'delivered'
 AND order_purchase_timestamp>='2017-01-05'
GROUP BY 1, 5, 6, 7
ORDER BY purchase_week ASC;