/*
Which regions generate the most profit?

Are there regions with high sales but low profit?

Are profits concentrated in a small number of locations?

How does average order value vary by region?
*/

select DISTINCT country from store_dim;
-- All Sales are only within the USA

select DISTINCT city, state from store_dim;

select SUM(sales) as city_sales, city from store_dim
GROUP BY city
ORDER BY city_sales DESC
LIMIT 10;
/*
major US metros capture the revenue stream. 
NYC dominates, with an over 80k USD margin above the next city, Los Angeles.
The top 5 cities retain a revenue generation rate above 100k,
but starting with Houston, per city revenue generation declines.
*/

select SUM(sales) as state_sales, state from store_dim
GROUP BY state
ORDER BY state_sales DESC
LIMIT 10;
/*
greatest geographical regions (states) that capture revenue are 
those which generate the most GDP, as well. sales seem correlated, at
least here, with GDP and overall state wealth, as well.
*/

-- regions with high sales but low revenue (finding which cities should be expanded into for marketing)
with salesshi as(
select city, SUM(sales) as city_sales, COUNT(order_id) as order_countz from store_dim
GROUP BY city
ORDER BY city_sales DESC
LIMIT 50
)

select city, (city_sales / order_countz) as sales_per_order from salesshi
order by sales_per_order desc;
/*
The cities returned, such as buffalo, are worth expanding into as they generate quite a lot of avg revenue per sale. 
It is critical to note how the difference in avg revenue per sale
between the #1 and #5 cities for the same calculation is around 300 USD.
This could suggest several confounding variables at play when it comes to 
the reasons for mid-size cities having more per-sale revenue.
*/

/*
To determine revenue concentration, I will look at prorportion of captured 
revenue in the top 10 states.
*/
with state_rev as(
select SUM(sales) as state_sales, state from store_dim
GROUP BY state
ORDER BY state_sales DESC

)

select state, (state_sales / 2261536.97) * 100 as rev_capture from state_rev


/*
The top 10 states account for 69.1% of all profits. 
After the top 5 states, there is a steep drop off,
showing how much operatons and marketing is important in coastal regions, as well as 
industrial powerhouses, like Texas and Penn.

The top 2 states, CA and NY, account for nearly 1/3 of the total revenue. 
This is important to note in terms of future marketing endeavours.

*/





