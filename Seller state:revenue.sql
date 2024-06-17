SELECT
 seller_city,
 SUM(price + freight_value) AS revenue
FROM
 `tc-da-1.olist_db.olist_order_items_dataset` items
INNER JOIN
 `tc-da-1.olist_db.olist_sellers_dataset` sellers
ON
 items.seller_id = sellers.seller_id
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;