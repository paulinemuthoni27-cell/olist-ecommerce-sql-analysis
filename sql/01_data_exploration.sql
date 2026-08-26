-- =====================================================
-- OLIST E-COMMERCE SQL ANALYSIS
-- 01: DATA EXPLORATION
-- =====================================================

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset;


-- 2. Total number of customers
SELECT COUNT(*) AS total_customers
FROM olist_customers_dataset;


-- 3. Total number of products
SELECT COUNT(*) AS total_products
FROM olist_products_dataset;


-- 4. Total number of sellers
SELECT COUNT(*) AS total_sellers
FROM olist_sellers_dataset;


-- 5. Total payment records
SELECT COUNT(*) AS total_payment_records
FROM olist_order_payments_dataset;


-- 6. Total review records
SELECT COUNT(*) AS total_reviews
FROM olist_order_reviews_dataset;


-- 7. Check the date range of orders
SELECT
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM olist_orders_dataset;
