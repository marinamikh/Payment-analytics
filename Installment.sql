SELECT
 string_field_1 AS product_category_name,
 SUM(price + freight_value) AS revenue,
 COUNT(CASE WHEN payment_installments >=1 THEN 1 END) AS had_installment,
 COUNT(CASE WHEN payment_installments = 1 THEN 1 END) AS one_installment,
 COUNT(CASE WHEN payment_installments = 2 THEN 1 END) AS installments_2,
 COUNT(CASE WHEN payment_installments = 3 THEN 1 END) AS installments_3,
 COUNT(CASE WHEN payment_installments = 4 THEN 1 END) AS installments_4,
 COUNT(CASE WHEN payment_installments = 5 THEN 1 END) AS installments_5,
 COUNT(CASE WHEN payment_installments = 6 THEN 1 END) AS installments_6,
 COUNT(CASE WHEN payment_installments = 7 THEN 1 END) AS installments_7,
 COUNT(CASE WHEN payment_installments = 8 THEN 1 END) AS installments_8,
 COUNT(CASE WHEN payment_installments = 9 THEN 1 END) AS installments_9,
 COUNT(CASE WHEN payment_installments = 10 THEN 1 END) AS installments_10,
 COUNT(CASE WHEN payment_installments = 11 THEN 1 END) AS installments_11,
 COUNT(CASE WHEN payment_installments = 12 THEN 1 END) AS installments_12,
 COUNT(CASE WHEN payment_installments = 13 THEN 1 END) AS installments_13,
 COUNT(CASE WHEN payment_installments = 14 THEN 1 END) AS installments_14,
 COUNT(CASE WHEN payment_installments = 15 THEN 1 END) AS installments_15,
 COUNT(CASE WHEN payment_installments = 16 THEN 1 END) AS installments_16,
 COUNT(CASE WHEN payment_installments = 17 THEN 1 END) AS installments_17,
 COUNT(CASE WHEN payment_installments = 18 THEN 1 END) AS installments_18,
 COUNT(CASE WHEN payment_installments = 19 THEN 1 END) AS installments_19,
 COUNT(CASE WHEN payment_installments = 20 THEN 1 END) AS installments_20,
 COUNT(CASE WHEN payment_installments = 21 THEN 1 END) AS installments_21,
 COUNT(CASE WHEN payment_installments = 22 THEN 1 END) AS installments_22,
 COUNT(CASE WHEN payment_installments = 23 THEN 1 END) AS installments_23,
 COUNT(CASE WHEN payment_installments = 24 THEN 1 END) AS installments_24
FROM
 `tc-da-1.olist_db.olist_order_items_dataset` items
INNER JOIN
 `tc-da-1.olist_db.olist_products_dataset` products
ON
 items.product_id = products.product_id
INNER JOIN
 `tc-da-1.olist_db.product_category_name_translation` translations
ON
 products.product_category_name = translations.string_field_0
INNER JOIN `olist_db.olist_order_payments_dataset` payment
ON 
items.order_id=payment.order_id
GROUP BY 1
ORDER BY revenue DESC
