/*
How do monthly sales change over time?

Which month has the highest average sales per order?

Is there seasonality (consistent peaks or dips)?

How does month-over-month growth look?

Are sales growing faster in later years vs earlier years?
*/

-- How do monthly sales change over time?
SELECT EXTRACT(month from order_date) as order_month,
        EXTRACT(year from order_date) as order_year,
        SUM(sales) as total_monthly_sales
FROM store_dim
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Is there seasonality (consistent peaks or dips)?
WITH monthly_sales AS (
    SELECT EXTRACT(month from order_date) as order_month,
            EXTRACT(year from order_date) as order_year,
            SUM(sales) as total_monthly_sales
    FROM store_dim
    GROUP BY order_year, order_month
    ORDER BY order_year, order_month
)

select AVG(total_monthly_sales) as avg_monthly_sales,
        order_month
from monthly_sales
group by order_month
order by order_month;

-- month over month growth, on average
SELECT 
EXTRACT(MONTH from order_date) as order_month,
AVG(sales) as average_monthly_sale
from 
store_dim
GROUP BY order_month
order by order_month; 

select EXTRACT(MONTH from order_date) as order_month, category, sub_category 
from store_dim
GROUP BY order_month, category, sub_category
order by order_month;

-- most popular category and sub-category by month
WITH monthly_category_sales AS (
    SELECT 
        EXTRACT(MONTH from order_date) as order_month,
        category,
        sub_category,
        SUM(sales) as total_sales
    FROM store_dim
    GROUP BY order_month, category, sub_category
)
SELECT 
    order_month,
    category,
    sub_category,
    total_sales,
    RANK() OVER (PARTITION BY order_month ORDER BY total_sales DESC) as sales_rank
FROM     monthly_category_sales
ORDER BY order_month;


-- are sales growing faster in earlier years or later years
with sales_yearly as(
    select extract(year from order_date) as yearly,
            sum(sales) as total_yearly_sales
    from store_dim
    group by(yearly)
    order by yearly
),
growth_comparison as(
    select (459425.94-479856.27) as growth_1 from sales_yearly
    union
    select (722051.96-600192.80) as growth_2 from sales_yearly
)
select * from growth_comparison
order by growth_1 asc;
-- the growth is decreasing on a yearly basis in the early years, but growing in the later years

--growth by month, by year

select 
extract(month from order_date) as order_month,
extract(year from order_date) as order_year,
sum(sales) as monthly_sales
FROM store_dim
GROUP BY order_year, order_month
ORDER BY order_month, order_year