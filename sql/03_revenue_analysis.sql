USE olist_ecommerce;

-- =====================================================
-- 03 SALES ANALYSIS
-- Olist E-commerce SQL Portfolio Project
-- =====================================================


-- 1. Overall Sales KPIs

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
)

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    ROUND(SUM(op.order_payment_total), 2) AS total_revenue,
    ROUND(
        SUM(op.order_payment_total) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id;


-- 2. Revenue by Year

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
)

SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    ROUND(SUM(op.order_payment_total), 2) AS total_revenue
FROM olist_orders_dataset o
JOIN order_payments op
    ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY YEAR(o.order_purchase_timestamp)
ORDER BY year;


-- 3. Monthly Revenue

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
)

SELECT
    DATE_FORMAT(
        o.order_purchase_timestamp,
        '%Y-%m'
    ) AS month,
    ROUND(SUM(op.order_payment_total), 2) AS revenue
FROM olist_orders_dataset o
JOIN order_payments op
    ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY DATE_FORMAT(
    o.order_purchase_timestamp,
    '%Y-%m'
)
ORDER BY month;


-- 4. Monthly Sales Performance
-- Includes order volume, revenue and average order value

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
)

SELECT
    DATE_FORMAT(
        o.order_purchase_timestamp,
        '%Y-%m'
    ) AS month,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(
        SUM(op.order_payment_total),
        2
    ) AS revenue,

    ROUND(
        SUM(op.order_payment_total) /
        COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value

FROM olist_orders_dataset o

JOIN order_payments op
    ON o.order_id = op.order_id

WHERE o.order_status = 'delivered'

GROUP BY DATE_FORMAT(
    o.order_purchase_timestamp,
    '%Y-%m'
)

ORDER BY month;
