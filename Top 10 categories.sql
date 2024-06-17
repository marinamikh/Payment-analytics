SELECT
 string_field_1 AS product_category_name,
 SUM(price + freight_value) AS revenue,
 COUNT(order_id) AS N_orders
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
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;
