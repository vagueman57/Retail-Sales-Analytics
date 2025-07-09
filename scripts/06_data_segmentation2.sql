/* group customers into three segments based on their spending behaviour:
-> VIP: at least 12 months of history and spending more than $5000
-> Regular: at least 12 months of history but spending $5000 or less
-> New: lifespan less than 12 months  
and find total number of customers by each group */

with customer_spending as (
select 
c.customer_key, 
sum(f.sales_amount) as total_spending,
min(order_date) as first_order,
max(order_date) as last_order,
datediff(month, min(order_date), max(order_date)) as lifespan
from gold.fact_sales f
left join gold.dim_customers c on f.customer_key = c.customer_key
group by c.customer_key
)

select customer_segment, 
	count(customer_key) as total_customers
from(
select customer_key,
	case when lifespan>=12 and total_spending>5000 then 'VIP'
	when lifespan>=12 and total_spending<=5000 then 'Regular'
	else 'New'
	end customer_Segment
from customer_spending)t
group by customer_Segment
order by total_customers