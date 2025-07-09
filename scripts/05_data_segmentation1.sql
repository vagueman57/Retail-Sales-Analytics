-- Data segmentation
-- group the data based on specific range
-- help understand the correlation between two measure
-- segment products into cost ranges and count how many products fal into each segment

with product_segments as (
select product_key,
	product_name, 
	cost,
	case when cost < 100 then 'Below 100'
	when cost between 100 and 500 then '100-500'
	when cost between 500 and 1000 then '500-1000'
	else 'Above 1000'
end cost_range
from gold.dim_products
)

select 
	cost_range, 
	count(product_key) as total_products
from product_segments
group by cost_range
order by total_products desc