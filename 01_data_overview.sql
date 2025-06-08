-- 01_data_overview.sql

-- Count of customer orders
SELECT COUNT(*) AS total_orders FROM customer_orders;

-- Unique pizzas available
SELECT COUNT(DISTINCT pizza_id) AS unique_pizzas FROM pizza_names;

-- Orders with multiple pizzas
SELECT order_id, COUNT(*) AS pizza_count
FROM customer_order_details
GROUP BY order_id
HAVING pizza_count > 1;

-- Cancelled orders
SELECT * FROM runner_orders WHERE cancellation IS NOT NULL AND cancellation <> '';
