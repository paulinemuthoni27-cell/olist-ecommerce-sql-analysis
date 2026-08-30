USE olist_ecommerce;

-- =====================================================
-- 02 CUSTOMER ANALYSIS
-- Olist E-commerce SQL Portfolio Project
-- =====================================================


-- 1. Customer Purchase Frequency
-- Shows how many customers placed 1, 2, 3+ orders

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC;


-- 2. Customer Frequency Distribution
-- Groups customers according to the number of orders they placed

SELECT
    customer_frequency,
    COUNT(*) AS number_of_customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS customer_frequency
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) AS customer_orders
GROUP BY customer_frequency
ORDER BY customer_frequency;


-- 3. One-Time vs Repeat Customers

SELECT
    CASE
        WHEN customer_frequency = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS number_of_customers
FROM (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS customer_frequency
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) AS customer_orders
GROUP BY customer_type;


-- 4. Top 10 Highest-Spending Customers
-- Payments are aggregated per order first to avoid
-- duplication caused by multiple payment records.

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
)

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.order_payment_total), 2) AS total_spent
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;


-- 5. One-Time vs Repeat Customer Spending

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
),

order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
),

customer_spending AS (
    SELECT
        c.customer_unique_id,
        SUM(op.order_payment_total) AS total_spent
    FROM olist_orders_dataset o
    JOIN olist_customers_dataset c
        ON o.customer_id = c.customer_id
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY c.customer_unique_id
)

SELECT
    CASE
        WHEN co.total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,

    COUNT(*) AS number_of_customers,

    ROUND(AVG(cs.total_spent), 2) AS average_customer_spend,

    ROUND(SUM(cs.total_spent), 2) AS total_revenue

FROM customer_orders co
JOIN customer_spending cs
    ON co.customer_unique_id = cs.customer_unique_id

GROUP BY customer_type
ORDER BY total_revenue DESC;
