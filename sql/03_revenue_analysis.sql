-- =====================================================
-- OLIST E-COMMERCE SQL ANALYSIS
-- 03: REVENUE ANALYSIS
-- =====================================================


-- =====================================================
-- 1. MONTHLY REVENUE
-- Payments are aggregated by order first to avoid
-- duplicate payment records.
-- =====================================================

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.order_payment_total), 2) AS revenue
FROM olist_orders_dataset o
JOIN (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
) AS p
    ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;


-- =====================================================
-- 2. YEARLY REVENUE
-- =====================================================

SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    ROUND(SUM(p.order_payment_total), 2) AS total_revenue
FROM olist_orders_dataset o
JOIN (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
) AS p
    ON o.order_id = p.order_id
GROUP BY year
ORDER BY year;


-- =====================================================
-- 3. YEAR-OVER-YEAR REVENUE GROWTH
-- =====================================================

WITH yearly_revenue AS (
    SELECT
        YEAR(o.order_purchase_timestamp) AS year,
        SUM(p.order_payment_total) AS total_revenue
    FROM olist_orders_dataset o
    JOIN (
        SELECT
            order_id,
            SUM(payment_value) AS order_payment_total
        FROM olist_order_payments_dataset
        GROUP BY order_id
    ) AS p
        ON o.order_id = p.order_id
    GROUP BY YEAR(o.order_purchase_timestamp)
),

revenue_growth AS (
    SELECT
        year,
        total_revenue,
        LAG(total_revenue) OVER (ORDER BY year) AS previous_year_revenue
    FROM yearly_revenue
)

SELECT
    year,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(previous_year_revenue, 2) AS previous_year_revenue,
    ROUND(
        (total_revenue - previous_year_revenue)
        / previous_year_revenue * 100,
        2
    ) AS revenue_growth_percent
FROM revenue_growth
ORDER BY year;


-- =====================================================
-- 4. TOP 10 MONTHS BY REVENUE
-- =====================================================

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.order_payment_total), 2) AS revenue
FROM olist_orders_dataset o
JOIN (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
) AS p
    ON o.order_id = p.order_id
GROUP BY month
ORDER BY revenue DESC
LIMIT 10;


-- =====================================================
-- 5. REVENUE BY PRODUCT CATEGORY
--
-- Payment values are allocated to items based on each
-- item's share of the order's product value.
--
-- This prevents payment values from being duplicated
-- when an order contains multiple products.
-- =====================================================

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
),

order_item_totals AS (
    SELECT
        order_id,
        SUM(price) AS order_product_total
    FROM olist_order_items_dataset
    GROUP BY order_id
),

category_revenue AS (
    SELECT
        p.product_category_name,
        oi.order_id,
        oi.price,
        op.order_payment_total,
        oit.order_product_total
    FROM olist_order_items_dataset oi
    JOIN olist_products_dataset p
        ON oi.product_id = p.product_id
    JOIN order_payments op
        ON oi.order_id = op.order_id
    JOIN order_item_totals oit
        ON oi.order_id = oit.order_id
)

SELECT
    product_category_name,
    ROUND(
        SUM(
            order_payment_total *
            (price / order_product_total)
        ),
        2
    ) AS total_revenue
FROM category_revenue
WHERE product_category_name IS NOT NULL
GROUP BY product_category_name
ORDER BY total_revenue DESC;


-- =====================================================
-- 6. RECONCILIATION CHECK
--
-- The category revenue calculation above should be
-- approximately equal to total payment revenue for
-- orders containing products.
-- =====================================================

WITH order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_payment_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
),

order_item_totals AS (
    SELECT
        order_id,
        SUM(price) AS order_product_total
    FROM olist_order_items_dataset
    GROUP BY order_id
)

SELECT
    ROUND(SUM(
        op.order_payment_total *
        (oit.order_product_total / oit.order_product_total)
    ), 2) AS total_allocated_revenue
FROM order_payments op
JOIN order_item_totals oit
    ON op.order_id = oit.order_id;
