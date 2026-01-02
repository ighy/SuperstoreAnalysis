/*
Which categories generate the most revenue?

Which sub-categories are consistently low in revenue?

What products are top sellers but low profit?
*/

-- Which categories generate the most revenue?
select category, SUM(sales) as category_sales from store_dim
group by category
order by sum(sales) desc;

/*
We see that the technology product category has the greatest sales revenue 
when compared to the other 2 product categories. This can likely be attributed
to the greater per-product selling price of technology products in the market, 
along with their greater number of purchases due compared to furniture, which often 
does not need replacing as much as technology does.
*/


select sum(sales) from store_dim
-- $2261536.97 is the total revenue over 4 years

-- lets find the percentage of revenue each category generates for the pie chart visual
select category, (SUM(sales) / 2261536.97) * 100 as percentage_revenue from store_dim
group by category
order by sum(sales) desc;

-- lets do the same for subcategories
select sub_category, (SUM(sales) / 2261536.97) * 100 as percentage_revenue from store_dim
group by sub_category
order by sum(sales) desc;

--top 10 products

select product_name, COUNT(order_id) as number_of_orders, avg(sales) as avg_sales
from store_dim
group by product_name
order by number_of_orders desc
LIMIT 10
/*
-- we see that the product 'staples' and 'avery non-stick binders' are high selling, yet yield a low revenue. 
    these are products to keep an eye on when marketing and during price-development
*/




