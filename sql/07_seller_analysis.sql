USE olist_ecommerce;

-- =====================================================
-- 07 SELLER ANALYSIS
-- Olist E-commerce SQL Portfolio Project
-- =====================================================


-- 1. Top 10 Sellers by Revenue

SELECT
    oi.seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue

FROM olist_order_items_dataset oi

GROUP BY oi.seller_id

ORDER BY total_revenue DESC

LIMIT 10;


-- 2. Top 10 Sellers by Number of Orders

SELECT
    oi.seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue

FROM olist_order_items_dataset oi

GROUP BY oi.seller_id

ORDER BY total_orders DESC

LIMIT 10;


-- 3. Top 10 Sellers by Items Sold

SELECT
    oi.seller_id,
    COUNT(*) AS items_sold,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price), 2) AS total_revenue

FROM olist_order_items_dataset oi

GROUP BY oi.seller_id

ORDER BY items_sold DESC

LIMIT 10;


-- 4. Seller Delivery Performance

SELECT
    oi.seller_id,

    COUNT(DISTINCT o.order_id) AS delivered_orders,

    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days

FROM olist_order_items_dataset oi

JOIN olist_orders_dataset o
    ON oi.order_id = o.order_id

WHERE
    o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL

GROUP BY oi.seller_id

HAVING COUNT(DISTINCT o.order_id) >= 20

ORDER BY average_delivery_days ASC
LIMIT 10;


-- 5. Seller Revenue and Delivery Performance

SELECT
    oi.seller_id,

    COUNT(DISTINCT oi.order_id) AS total_orders,

    COUNT(*) AS items_sold,

    ROUND(SUM(oi.price), 2) AS product_revenue,

    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days

FROM olist_order_items_dataset oi

JOIN olist_orders_dataset o
    ON oi.order_id = o.order_id

WHERE
    o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL

GROUP BY oi.seller_id

ORDER BY product_revenue DESC

LIMIT 10;
