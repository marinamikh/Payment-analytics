Presentation and SQL code files you can find above. Links to GoogleSheets files (original tables and graphs used in presentation) will be listed in the end of this file. 
Some details of my analysis will be described here.

We start this payment/monetization analysis with general information:

<img width="424" alt="image" src="https://github.com/TuringCollegeSubmissions/mmikha-ABP.3.3/assets/120615415/a25dd06d-1bf2-4f86-a394-779fbc2fa4b4">
<img width="427" alt="image" src="https://github.com/TuringCollegeSubmissions/mmikha-ABP.3.3/assets/120615415/7bd2a786-0ca7-474b-a86f-8ab30396693b">

Then identifying tasks for this current analysis (see presentation, slide 5)

1. With first question we will try to analyze installments, what categories tend to be paid with installments, how many installments customers choose. Part of the query used is below:
```
SELECT
 string_field_1 AS product_category_name,
 SUM(price + freight_value) AS revenue,
 COUNT(CASE WHEN payment_installments >=1 THEN 1 END) AS had_installment,
 COUNT(CASE WHEN payment_installments = 1 THEN 1 END) AS one_installment,
 COUNT(CASE WHEN payment_installments = 2 THEN 1 END) AS installments_2,
 COUNT(CASE WHEN payment_installments = 3 THEN 1 END) AS installments_3
```
We see that most of the customers that chose to pay via installment had 1-3 installments, all the insights with graphs examples are listed on slide 7.

<img width="844" alt="image" src="https://github.com/TuringCollegeSubmissions/mmikha-ABP.3.3/assets/120615415/3b77ebf8-8226-4791-aa5e-f76336d5767d">


2. Second question for analysis is about payment methods and for that we use this following query:
```
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
```
<img width="655" alt="image" src="https://github.com/TuringCollegeSubmissions/mmikha-ABP.3.3/assets/120615415/9c5db86b-590c-4221-83b0-77b9e8f5a2f2">

As a result - Leading category of chosen payment method both in number of orders and revenue made – credit card, debit card is the least used one. Here we also analyse the seller states and cities leading by revenue. Graphs and conclusions are presented on slides 10-11.

3. Third point for analysis is about delivery. Here we review times spent on confirming, shipping out and delivering the orders, also the difference between estimated and actual delivery time. 
```
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
```
<img width="488" alt="image" src="https://github.com/TuringCollegeSubmissions/mmikha-ABP.3.3/assets/120615415/a984cacc-70fd-446a-99ee-b5e056ae8094">

Google Sheets docs

Installments: https://docs.google.com/spreadsheets/d/1Mz8NoLXrUK1CG_8Lbu6fZ_xUWSQwMa25790rzILFJ2M/edit?usp=sharing

Payment types/states: https://docs.google.com/spreadsheets/d/1sEC7CslzUKdmJJuYGC41mzTY4V9ZSuyM-m3spgCItZU/edit?usp=sharing

Payment type/revenue/number of orders: https://docs.google.com/spreadsheets/d/1U8_pyVIazBSeeGK2JHVDD6KodxOsxtDlMmf-S_UPvnY/edit?usp=sharing

Seller city/revenue: https://docs.google.com/spreadsheets/d/1zBxnnIf1BNcZtslBByVtk2xsV91NajFLcLb2wlfB3rM/edit?usp=sharing

Seller state/revenue: https://docs.google.com/spreadsheets/d/1PCjaoy66p_GnEcplpbosNvW08D101WdS8mRv48nHk3g/edit?usp=sharing

Delivery duration: https://docs.google.com/spreadsheets/d/13RjDlS6_zdbXxlRH23BTZuwz0AQ-vzHSVa9Hdqs5ubk/edit?usp=sharing

Product categories: https://docs.google.com/spreadsheets/d/1tU2AC7S3aU-wCxNXzSVddPu-GpovgowC29RtdXPejjU/edit?usp=sharing




