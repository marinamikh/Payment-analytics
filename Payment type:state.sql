SELECT
 seller_state,
 SUM(price + freight_value) AS revenue, 
 payment_type,
 COUNT(payment_type) AS N_of_orders
FROM
 `tc-da-1.olist_db.olist_order_items_dataset` items
INNER JOIN
 `tc-da-1.olist_db.olist_sellers_dataset` sellers
ON
 items.seller_id = sellers.seller_id
 INNER JOIN `olist_db.olist_order_payments_dataset` payment
ON items.order_id = payment.order_id
GROUP BY 1,3
ORDER BY 1, revenue DESC
