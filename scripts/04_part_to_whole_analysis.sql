-- Part to whole analysis
/* Analyze how an individual part is performing compared to the overall, allowing 
us to understand which category has the greatest impact on buisness. */

with category_sales as(
select category, 
	sum(sales_amount) total_sales
from gold.fact_sales as f
left join gold.dim_products as p on p.product_key = f.product_key
group by category
)

select category,
	total_sales,
	sum(total_Sales) over() overall_sales,
	concat(round((cast(total_Sales as float) / sum(total_sales) over())*100, 2), '%') as '%of_total'
from category_sales
order by total_sales desc
