-- 02_key_metrics.sql

-- Most popular pizzas
SELECT pn.pizza_name, COUNT(*) AS order_count
FROM customer_order_details cod
JOIN pizza_names pn ON cod.pizza_id = pn.pizza_id
GROUP BY pn.pizza_name
ORDER BY order_count DESC;

-- Top customers by number of orders
SELECT customer_id, COUNT(*) AS total_orders
FROM customer_orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- Total pizzas sold
SELECT COUNT(*) AS total_pizzas_sold FROM customer_order_details;

-- Pizza popularity share (%)
SELECT
  pn.pizza_name,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_order_details), 2) AS popularity_pct
FROM customer_order_details cod
JOIN pizza_names pn ON cod.pizza_id = pn.pizza_id
GROUP BY pn.pizza_name
ORDER BY popularity_pct DESC;
