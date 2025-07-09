-- year and month simultaneous analysis
select 
	year(order_date) as order_year,
	month(order_date) as order_month, 
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customers,
	sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date), month(order_date)
order by year(order_date), month(order_date)


-- our customised format
select 
	format(order_date, 'yyyy-MMM') as order_date, 
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customers,
	sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by format(order_date, 'yyyy-MMM')
order by format(order_date, 'yyyy-MMM')


-- using DATETRUNC
select 
	datetrunc(month, order_date) as order_date, 
	sum(sales_amount) as total_sales,
	count(distinct customer_key) as total_customers,
	sum(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by datetrunc(MONTH, order_date)
order by datetrunc(month, order_date)
