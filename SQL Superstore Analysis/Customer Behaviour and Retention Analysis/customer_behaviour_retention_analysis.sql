/*
How many unique customers does the store have?

What percentage of customers are returning vs new?

What percentage of total revenue comes from returning customers?

Do returning customers have a higher average order value than new customers?

Who are the top 10 customers by lifetime spend?

*/

-- How many unique customers does the store have?
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM store_dim;

-- What percentage of customers are returning vs new?
SELECT customer_type, 
        CASE
            WHEN customer_type = 'Returning' THEN 
                ROUND((COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM store_dim)), 2)
            ELSE 
                ROUND((COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM store_dim)), 2)
        END AS percentage
FROM(
    SELECT 
        customer_name,
        CASE
            WHEN COUNT(order_id) > 1 THEN 'Returning'
            ELSE 'New'
        END AS customer_type
    FROM store_dim
    GROUP BY order_id, customer_name
)
GROUP BY (customer_type);

-- what percentage of total revenue comes from returning customers?
WITH customer_revenue AS (
    SELECT 
        customer_id,
        SUM(sales) as total_customer_sales,
        COUNT(order_id) as order_count
    FROM store_dim
    GROUP BY customer_id
)
SELECT 
    SUM(CASE WHEN order_count > 1 THEN total_customer_sales ELSE 0 END) 
    / SUM(total_customer_sales) * 100 AS returning_revenue_percentage
FROM customer_revenue;


-- Do returning customers have a higher average order value than new customers?
WITH new_customers as(
SELECT customer_id, COUNT(order_id) as order_count, AVG(sales) as new_sales
FROM store_dim
GROUP BY customer_id
HAVING COUNT(order_id) = 1
),
returning_customers as(
SELECT customer_id, COUNT(order_id) as order_count, AVG(sales) as recurring_sales
FROM store_dim
GROUP BY customer_id
HAVING COUNT(order_id) > 1
)

SELECT AVG(recurring_sales) from returning_customers
UNION ALL
SELECT AVG(new_sales) from new_customers; -- returning customers have a higher avg order value than new customers


-- Who are the top 10 customers by lifetime spend?
SELECT customer_name, SUM(sales) as lifetime_spend
FROM store_dim
GROUP BY customer_name
ORDER BY lifetime_spend DESC
LIMIT 10;