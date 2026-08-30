USE olist_ecommerce;

-- =====================================================
-- 08 CUSTOMER SATISFACTION ANALYSIS
-- Olist E-commerce SQL Portfolio Project
-- =====================================================


-- 1. Review Score Distribution

SELECT
    review_score,
    COUNT(*) AS total_reviews

FROM olist_order_reviews_dataset

GROUP BY review_score

ORDER BY review_score DESC;


-- 2. Overall Review Performance

SELECT
    COUNT(*) AS total_reviews,

    ROUND(
        AVG(review_score),
        2
    ) AS average_review_score

FROM olist_order_reviews_dataset;


-- 3. Review Score by Delivery Status

SELECT
    CASE
        WHEN o.order_delivered_customer_date >
             o.order_estimated_delivery_date
        THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,

    COUNT(DISTINCT r.order_id) AS total_reviews,

    ROUND(
        AVG(r.review_score),
        2
    ) AS average_review_score

FROM olist_order_reviews_dataset r

JOIN olist_orders_dataset o
    ON r.order_id = o.order_id

WHERE
    o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
    AND o.order_estimated_delivery_date IS NOT NULL

GROUP BY delivery_status

ORDER BY average_review_score DESC;


-- 4. Review Performance by Product Category

SELECT
    p.product_category_name,

    COUNT(DISTINCT r.order_id) AS total_reviews,

    ROUND(
        AVG(r.review_score),
        2
    ) AS average_review_score

FROM olist_order_reviews_dataset r

JOIN olist_order_items_dataset oi
    ON r.order_id = oi.order_id

JOIN olist_products_dataset p
    ON oi.product_id = p.product_id

WHERE p.product_category_name IS NOT NULL

GROUP BY p.product_category_name

HAVING COUNT(DISTINCT r.order_id) >= 5

ORDER BY average_review_score DESC;


-- 5. Lowest-Rated Product Categories

SELECT
    p.product_category_name,

    COUNT(DISTINCT r.order_id) AS total_reviews,

    ROUND(
        AVG(r.review_score),
        2
    ) AS average_review_score

FROM olist_order_reviews_dataset r

JOIN olist_order_items_dataset oi
    ON r.order_id = oi.order_id

JOIN olist_products_dataset p
    ON oi.product_id = p.product_id

WHERE p.product_category_name IS NOT NULL

GROUP BY p.product_category_name

HAVING COUNT(DISTINCT r.order_id) >= 5

ORDER BY average_review_score ASC
LIMIT 10;
