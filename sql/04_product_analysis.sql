USE olist_ecommerce;

-- =====================================================
-- 04 PRODUCT ANALYSIS
-- Olist E-commerce SQL Portfolio Project
-- =====================================================


-- 1. Product Category Performance
-- Revenue and number of items sold by category

SELECT
    p.product_category_name,
    COUNT(oi.product_id) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
WHERE p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;


-- 2. Product Category Revenue per Item

SELECT
    p.product_category_name,
    COUNT(oi.product_id) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(
        SUM(oi.price) / COUNT(oi.product_id),
        2
    ) AS revenue_per_item
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
WHERE p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
ORDER BY revenue_per_item DESC;


-- 3. Top 10 Products by Number of Items Sold

SELECT
    oi.product_id,
    p.product_category_name,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price), 2) AS product_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_category_name
ORDER BY items_sold DESC
LIMIT 10;


-- 4. Top 10 Products by Revenue

SELECT
    oi.product_id,
    p.product_category_name,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 5. Top 10 Products by Average Selling Price

SELECT
    oi.product_id,
    p.product_category_name,
    COUNT(*) AS items_sold,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(AVG(oi.price), 2) AS average_price
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_category_name
HAVING COUNT(*) >= 2
ORDER BY average_price DESC
LIMIT 10;
