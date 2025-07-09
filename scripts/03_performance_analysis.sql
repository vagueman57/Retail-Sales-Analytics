/* Analyze the yearly perfromance of products by comparing each product's sales
to both its average salesperformance and the the previous year's sales */

with yearly_product_sales as (
  select 
	year(f.order_date) as order_year,
	p.product_name,
	sum(f.sales_amount) as current_sales
  from gold.fact_sales as f
  left join gold.dim_products as p on f.product_key = p.product_key
  where f.order_date is not null
  group by year(f.order_date), p.product_name
)

select 
	order_year, 
	product_name, 
	current_sales,
	avg(current_sales) over(partition by product_name) as avg_sales,
	current_sales - avg(current_sales) over(partition by product_name) as avg_diff,
	case when current_sales - avg(current_sales) over(partition by product_name) > 0 then 'Above Avg'
	     when current_sales - avg(current_sales) over(partition by product_name) < 0 then 'Below Avg'
		 else 'Avg' end as avg_change,
-- year over year analysis  
	lag(current_Sales) over(partition by product_name order by order_year) prev_year_sales,
	current_sales - lag(current_Sales) over(partition by product_name order by order_year) as prev_year_diff,
	case when current_sales - lag(current_Sales) over(partition by product_name order by order_year) > 0 then 'increasing'
	     when current_sales - lag(current_Sales) over(partition by product_name order by order_year) < 0 then 'decreasing'
		 else 'No Change' end as prev_year_change
from yearly_product_sales
order by product_name, order_year