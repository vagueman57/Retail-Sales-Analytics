-- calculate the total sales per month
-- and the runnung total of sales over time

select 
	order_date,
	total_sales,
	sum(total_sales) over (partition by order_date order by order_date) as total_running_Sales,
	avg(avg_price) over(partition by order_date order by order_Date) as moving_avg_price
from(
	select
		DATETRUNC(month, order_date) as order_date, 
		sum(sales_amount) as total_sales,
		avg(price) as avg_price
	from gold.fact_sales
	where order_date is not null
	group by DATETRUNC(month, order_date)
)t
