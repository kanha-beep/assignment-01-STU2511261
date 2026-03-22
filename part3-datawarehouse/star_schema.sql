CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month_number INT NOT NULL,
    month_name VARCHAR(15) NOT NULL,
    quarter_number INT NOT NULL,
    year_number INT NOT NULL
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(12, 2) NOT NULL,
    sales_revenue DECIMAL(14, 2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date (date_id, full_date, month_number, month_name, quarter_number, year_number) VALUES
(20230829, '2023-08-29', 8, 'August', 3, 2023),
(20231212, '2023-12-12', 12, 'December', 4, 2023),
(20230205, '2023-02-05', 2, 'February', 1, 2023),
(20230220, '2023-02-20', 2, 'February', 1, 2023),
(20230115, '2023-01-15', 1, 'January', 1, 2023),
(20230809, '2023-08-09', 8, 'August', 3, 2023),
(20230331, '2023-03-31', 3, 'March', 1, 2023),
(20231026, '2023-10-26', 10, 'October', 4, 2023),
(20231208, '2023-12-08', 12, 'December', 4, 2023),
(20230815, '2023-08-15', 8, 'August', 3, 2023);

INSERT INTO dim_store (store_id, store_name, store_city) VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune');

INSERT INTO dim_product (product_id, product_name, category) VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Groceries'),
(6, 'Jeans', 'Clothing'),
(7, 'Biscuits', 'Groceries');

INSERT INTO fact_sales (sale_id, date_id, store_id, product_id, units_sold, unit_price, sales_revenue) VALUES
(1, 20230829, 1, 1, 3, 49262.78, 147788.34),
(2, 20231212, 1, 2, 11, 23226.12, 255487.32),
(3, 20230205, 1, 3, 20, 48703.39, 974067.80),
(4, 20230220, 2, 2, 14, 23226.12, 325165.68),
(5, 20230115, 1, 4, 10, 58851.01, 588510.10),
(6, 20230809, 3, 5, 12, 52464.00, 629568.00),
(7, 20230331, 4, 4, 6, 58851.01, 353106.06),
(8, 20231026, 4, 6, 16, 2317.47, 37079.52),
(9, 20231208, 3, 7, 9, 27469.99, 247229.91),
(10, 20230815, 3, 4, 3, 58851.01, 176553.03);
