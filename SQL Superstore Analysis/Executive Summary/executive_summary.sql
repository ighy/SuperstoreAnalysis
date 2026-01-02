/*
Total customers

Total orders

Total revenue

Average order value
*/

SELECT COUNT(DISTINCT customer_id) as number_customers FROM store_dim;
-- There are 793 distinct customers that have ordered from the shop between 2015 - 2018.

SELECT COUNT(order_id) from store_dim;
-- there have been 9800 orders placed over the span of 4 years.

SELECT SUM(sales) from store_dim;
-- There was a total revenue made of $2,261,526.97 over 4 years.
-- Considering that this is a superstore, I cannot, with certaninty, say that this is a high revenue.

SELECT AVG(sales) from store_dim;
-- The average order value is about $230.77. 
-- This suggests a relatively high average order value, or that customers prefer to buy in bulk.




