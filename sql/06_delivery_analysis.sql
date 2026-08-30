USE olist_ecommerce;

-- =====================================================
-- 06 DELIVERY ANALYSIS
-- Olist E-commerce SQL Portfolio Project
-- =====================================================


-- 1. Average Delivery Time

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS average_delivery_days
FROM olist_orders_dataset
WHERE
    order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL;


-- 2. Delivery Status: On Time vs Late

SELECT
    CASE
        WHEN order_delivered_customer_date >
             order_estimated_delivery_date
        THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,

    COUNT(DISTINCT order_id) AS total_orders

FROM olist_orders_dataset

WHERE
    order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL

GROUP BY delivery_status
ORDER BY total_orders DESC;


-- 3. Overall Late Delivery Rate

SELECT
    COUNT(DISTINCT order_id) AS total_delivered_orders,

    COUNT(
        DISTINCT CASE
            WHEN order_delivered_customer_date >
                 order_estimated_delivery_date
            THEN order_id
        END
    ) AS late_orders,

    COUNT(
        DISTINCT CASE
            WHEN order_delivered_customer_date <=
                 order_estimated_delivery_date
            THEN order_id
        END
    ) AS on_time_orders,

    ROUND(
        100.0 *
        COUNT(
            DISTINCT CASE
                WHEN order_delivered_customer_date >
                     order_estimated_delivery_date
                THEN order_id
            END
        )
        / COUNT(DISTINCT order_id),
        2
    ) AS late_delivery_rate

FROM olist_orders_dataset

WHERE
    order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;


-- 4. Order Status Distribution

SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        100.0 * COUNT(DISTINCT order_id) /
        (SELECT COUNT(DISTINCT order_id)
         FROM olist_orders_dataset),
        2
    ) AS percentage

FROM olist_orders_dataset

GROUP BY order_status
ORDER BY total_orders DESC;
