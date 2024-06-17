SELECT
 DATE(DATE_TRUNC(orders.order_purchase_timestamp, WEEK)) AS purchase_week,
 payments.payment_type,
 COUNT(DISTINCT orders.customer_id) AS customers_count,
 COUNT(orders.order_id) AS orders_count,
 SUM(payments.payment_value) AS payments_amount
FROM
 `tc-da-1.olist_db.olist_orders_dataset` orders
INNER JOIN
 `tc-da-1.olist_db.olist_order_payments_dataset` payments
ON
 orders.order_id = payments.order_id
WHERE payments.payment_type = 'credit_card' OR payments.payment_type ='boleto' OR payments.payment_type ='voucher' OR payments.payment_type = 'debit_card'
GROUP BY 1,2
ORDER BY purchase_week, payment_type ASC;