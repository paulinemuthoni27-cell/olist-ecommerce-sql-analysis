-- =====================================================
-- OLIST E-COMMERCE SQL ANALYSIS
-- 02: CUSTOMER ANALYSIS
-- =====================================================


-- =====================================================
-- 1. CUSTOMER ORDER FREQUENCY
-- =====================================================

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC;


-- =====================================================
-- 2. CUSTOMER FREQUENCY DISTRIBUTION
-- =====================================================

SELECT
    total_orders,
    COUNT(*) AS number_of_customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) AS customer_frequency
GROUP BY total_orders
ORDER BY total_orders;


-- =====================================================
-- 3. REPEAT CUSTOMER RATE
-- =====================================================

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN total_orders = 1 THEN 1 ELSE 0 END) AS one_time_customers,
    SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS repeat_customer_rate,
    ROUND(
        SUM(CASE WHEN total_orders = 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS one_time_customer_rate
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) AS customer_frequency;


-- =====================================================
-- 4. TOP 10 HIGHEST-SPENDING CUSTOMERS
-- Payment records are aggregated by order first
-- to avoid potential payment duplication.
-- =====================================================

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(order_payments.order_payment_total), 2) AS total_spent
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
JOIN (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
) AS order_payments
    ON o.order_id = order_payments.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;


-- =====================================================
-- 5. CHECK PAYMENT RECORDS VS UNIQUE ORDERS
-- =====================================================

SELECT
    COUNT(*) AS total_payment_records,
    COUNT(DISTINCT order_id) AS unique_orders
FROM olist_order_payments_dataset;
