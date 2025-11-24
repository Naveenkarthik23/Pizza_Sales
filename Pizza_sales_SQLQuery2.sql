
select * from pizza_sales
use [pizza db]
--- KPI REQUIREMENTS---
--- total Revenue of the company
select sum(total_price) as Total_Revenue from pizza_sales
--- average order value
select sum(total_price)/ count (distinct order_id) as Avg_order_value from pizza_sales
--- total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales
--- total order placed
select count (distinct order_id) as total_order_placed from pizza_sales
--- Average pizzas per order
select sum(quantity)/count(distinct order_id) as avg_pizza_ordered from pizza_sales
--- cast syntax is used to convert the final output into decimal values 
select cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) from pizza_sales
--- PROBLEM STATEMENT----
--- daily trend for total orders
select DATENAME(dw, order_date) as order_day,count(distinct order_id) as total_order 
from pizza_sales
group by DATENAME(dw, order_date)
--- monthly trend for total orders
select DATENAME(month,order_date) as order_day,count(distinct order_id) as total_order
from pizza_sales
group by DATENAME(month,order_date)
order by total_order desc
--- sales percentage for different category of pizza including month wise result
select * from pizza_sales
select pizza_category,sum(total_price) as total_sales, sum(total_price)* 100 /
(select sum(total_price) from pizza_sales where MONTH(order_date)=1) as sales_percentage from pizza_sales
where MONTH(order_date)=1
group by pizza_category
--- Percentage of sales by pizza size
select pizza_size,sum(total_price) as total_sales,sum(total_price)*100/
(select sum(total_price) from pizza_sales) as sales_percentage
from pizza_sales
group by pizza_size
order by sales_percentage desc
--- top 5 selling pizza name and revenue
select top 5 pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
--- bottom 5 selling pizza name and revenue
select top 5 pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc
--- top 5 selling pizza name and quantity
select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc
--- bottom 5 selling pizza name and quantity
select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc
















