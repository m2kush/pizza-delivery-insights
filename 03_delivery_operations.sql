-- 03_delivery_operations.sql

-- Completed deliveries only
WITH completed AS (
  SELECT *
  FROM runner_orders
  WHERE cancellation IS NULL OR cancellation = ''
)

-- Avg time and distance per runner
SELECT runner_id,
       ROUND(AVG(duration), 2) AS avg_duration_minutes,
       ROUND(AVG(distance), 2) AS avg_distance_km
FROM completed
GROUP BY runner_id;

-- Delivery efficiency (speed)
SELECT runner_id,
       ROUND(SUM(distance) / (SUM(duration) / 60), 2) AS avg_speed_kmph
FROM completed
GROUP BY runner_id;

-- Hourly delivery distribution
SELECT
  STRFTIME('%H', pickup_time) AS delivery_hour,
  COUNT(*) AS deliveries
FROM completed
WHERE pickup_time IS NOT NULL
GROUP BY delivery_hour
ORDER BY delivery_hour;

-- Cancelled orders stats
SELECT
  cancellation,
  COUNT(*) AS cancel_count
FROM runner_orders
WHERE cancellation IS NOT NULL AND cancellation <> ''
GROUP BY cancellation;
