--SQL Retail Sales Analysis

--My Analysis and Findings

--Q1. Write a SQL query to find the total number of orders:
SELECT COUNT(DISTINCT transactions_id) AS total_orders FROM sales_data;

--Q2. Write a SQL query to find number of orders per category?
SELECT 
    category,
    COUNT(*) AS number_of_orders
FROM sales_data
GROUP BY category
ORDER BY number_of_orders DESC;

--Q3. Write a SQL query to find the range of order dates?
SELECT 
    MIN(sale_date) AS first_order,
    MAX(sale_date) AS last_order
FROM sales_data;

--Q4. Write a SQL query to find the Average Order Value (AOV):
SELECT 
    ROUND(AVG(total_sale), 2) AS avg_order_value
FROM sales_data;

--Q5. Write a SQL query to find the Best-Selling Categories:
SELECT
    category,
    SUM(quantiy) AS total_quantity_sold
FROM sales_data
GROUP BY category
ORDER BY total_quantity_sold DESC
LIMIT 10;

--Q6. Write a SQL query to find the number of unique customers who purchased items from each category:
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM sales_data
GROUP BY category

--Q7. Write a SQL query to find the Total Number of Customers:
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM sales_data;

--Q8. Write a SQL query to find the number of Repeat Customers: 
SELECT
 customer_id,
COUNT(DISTINCT transactions_id) AS order_count FROM sales_data
GROUP BY customer_id
HAVING order_count > 1;

--Q9. Write a SQL query to find the Sales by Gender and Category:
SELECT
    gender,
    category,
    SUM(total_sale) AS total_sales
FROM sales_data
GROUP BY gender, category
ORDER BY total_sales DESC;

--Q10. Write a SQL query for Quarterly/yearly analysis:
SELECT 
    YEAR(sale_date) AS sale_year,
    QUARTER(sale_date) AS sale_quarter,
    SUM(total_sale) AS total_sales
FROM sales_data
GROUP BY YEAR(sale_date), QUARTER(sale_date)
ORDER BY YEAR(sale_date), QUARTER(sale_date);

--Q11. Write a SQL query to find the Total Revenue:
SELECT SUM(total_sale) AS total_revenue
FROM sales_data;

--Q12. Write a SQL query to find the top 5 customers based on the highest total sales:
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM sales_data
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


--END OF PROJECT
