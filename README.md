# 🍕 Pizza Sales Analysis – End-to-End Project
### Power BI | SQL | Python | Excel | Tableau
## 📌 Project Description

This project analyzes two years of pizza sales data using Power BI, MySQL, and Python.
The objective was to understand customer behavior, sales trends, product performance, and operational patterns to help business stakeholders make data-driven decisions.
Using Python, the data was cleaned, transformed, and prepared for MySQL storage.
Key KPIs and business metrics were calculated using SQL queries, and the final interactive dashboard was built in Power BI (as shown in the images).

The dashboard provides insights into:

Revenue performance

Order patterns by day/month

Best-selling & worst-selling pizzas

Sales distribution by category & size

Average order behavior

Monthly & daily trends

Product-level contribution

## ⭐ Key Metrics (KPIs Used in Dashboard)
KPI	Meaning	Insight from Dashboard
Total Revenue	Total money earned	817.86K shows strong overall sales
Avg Order Value (AOV)	Revenue / Number of orders	₹38.31 average per order
Total Pizza Sold	Total units sold	49,574 pizzas sold
Total Orders	Number of transactions	21,350 orders
Avg Pizza Per Order	Total pizzas / orders	2.32 pizzas per order
Top Pizza Size	Size that generates highest sales	Large size is the best performer
Top Category	Pizza category with highest contribution	Classic pizzas lead in revenue & orders
## ⭐ Insights From Dashboard (Based on the Images)
### 📌 1. Busiest Days & Months

Friday & Saturday have highest order volumes

Customers order more pizzas during evenings and weekends

July and January show peak monthly sales

Seasonal demand affects ordering behavior

### 📌 2. Sales Performance

Classic Pizzas dominate both revenue and order count

Large size pizzas contribute 45% of total sales

Veggie & Supreme categories also perform well

### 📌 3. Best Sellers

Best Selling Pizza by Revenue:
✔ Thai Chicken Pizza

Best Selling Pizza by Quantity:
✔ Classic Deluxe Pizza

Best by Total Orders:
✔ Classic Deluxe Pizza

### 📌 4. Worst Sellers

Least Revenue Generator:
✘ Brie Carre Pizza

Least Sold by Quantity:
✘ Brie Carre Pizza

*Bottom 5 pizzas also include Spinach, Mediterranean, etc.

### 📌 5. Trend Insights

Monthly sales rise from Feb → July

Drop during Aug–Oct

Peak again in December

Daily trend peaks on Friday (~3.5K orders)

## ⭐ SQL QUERIES (Used to Generate KPIs)
### 1️⃣ Total Revenue

SELECT ROUND(SUM(total_price),2) AS total_revenue
FROM orders;

### 2️⃣ Average Order Value

SELECT ROUND(SUM(total_price) / COUNT(order_id), 2) AS avg_order_value
FROM orders;

### 3️⃣ Total Pizzas Sold

SELECT SUM(quantity) AS total_pizza_sold
FROM order_details;

### 4️⃣ Total Orders

SELECT COUNT(order_id) AS total_orders
FROM orders;

### 5️⃣ Daily Trend (Orders per Day)

SELECT DAYNAME(order_date) AS day, COUNT(order_id) AS total_orders
FROM orders
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC;

### 6️⃣ Monthly Trend

SELECT MONTHNAME(order_date) AS month, COUNT(order_id) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

### 7️⃣ Sales by Category

SELECT pizza_category, SUM(quantity) AS total_sold
FROM pizzas p
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY pizza_category;

### 8️⃣ Top 5 Best Sellers by Revenue

SELECT p.pizza_name, SUM(od.quantity * p.price) AS revenue
FROM pizzas p
JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.pizza_name
ORDER BY revenue DESC
LIMIT 5;

## ⭐ Python Code (ETL + KPIs)
### 🔹 Load, Clean, Transform Data
import pandas as pd

orders = pd.read_csv("orders.csv")
details = pd.read_csv("order_details.csv")
pizzas = pd.read_csv("pizzas.csv")

orders['order_date'] = pd.to_datetime(orders['order_date'])
orders.drop_duplicates(inplace=True)

### 🔹Merge Data
df = details.merge(pizzas, on='pizza_id')
df = df.merge(orders, on='order_id')

df['total_price'] = df['quantity'] * df['price']

### 🔹 KPI Calculations
total_revenue = df['total_price'].sum()
avg_order_value = total_revenue / df['order_id'].nunique()
total_pizzas_sold = df['quantity'].sum()
total_orders = df['order_id'].nunique()
avg_pizza_per_order = total_pizzas_sold / total_orders

### 🔹 Daily & Monthly Trends
daily_trend = orders.groupby(orders['order_date'].dt.day_name())['order_id'].count()
monthly_trend = orders.groupby(orders['order_date'].dt.month_name())['order_id'].count()
















## ⭐ Power BI Work Done

Created star schema using fact and dimension tables

Built DAX measures for revenue, AOV, and trends:

Total Revenue = SUM(order_details[total_price])
Avg Order Value = [Total Revenue] / DISTINCTCOUNT(orders[order_id])


Added slicers for:

Pizza Category

Date Range

Pizza Size

Used:

Line charts for monthly trends

Bar charts for top/bottom pizzas

Donut charts for category & size distribution

Cards for KPIs

## ⭐ Conclusion

The Pizza Sales Dashboard reveals that overall business performance is strong, with consistent demand peaks during weekends and specific months like July and January.
Classic and Large pizzas dominate sales, clearly showing customer preference.
While most pizzas perform well, a few like Brie Carre require promotional strategies to increase visibility.

The insights help management optimize inventory, plan pricing strategies, schedule staff efficiently, and focus marketing on high-performing periods.


## 🔗 Project Links & Resources

SQL Scripts (DDL + DML):https://github.com/Naveenkarthik23/Pizza_Sales/blob/main/Pizza_sales_SQLQuery2.sql

Python ETL Notebook:https://github.com/Naveenkarthik23/Pizza_Sales/blob/main/Pizza_Sales_Python.ipynb

Dashboard Images 1:![power bi dashboard 1](https://github.com/user-attachments/assets/28707841-7a31-4092-807b-d0189d140ae0)

Dashboard Images 2:![power bi dashboard 2](https://github.com/user-attachments/assets/8b83beaa-2168-474b-a903-93cd978b3480)

