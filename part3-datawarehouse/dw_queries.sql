-- Q1: Total sales revenue by product category for each month
SELECT
    d.year_number,
    d.month_number,
    d.month_name,
    p.category,
    SUM(f.sales_revenue) AS total_sales_revenue
FROM fact_sales f
JOIN dim_date d
    ON f.date_id = d.date_id
JOIN dim_product p
    ON f.product_id = p.product_id
GROUP BY d.year_number, d.month_number, d.month_name, p.category
ORDER BY d.year_number, d.month_number, p.category;

-- Q2: Top 2 performing stores by total revenue
SELECT
    s.store_name,
    s.store_city,
    SUM(f.sales_revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s
    ON f.store_id = s.store_id
GROUP BY s.store_name, s.store_city
ORDER BY total_revenue DESC
LIMIT 2;

-- Q3: Month-over-month sales across all stores
SELECT
    d.year_number,
    d.month_number,
    d.month_name,
    SUM(f.sales_revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY d.year_number, d.month_number, d.month_name
ORDER BY d.year_number, d.month_number;
