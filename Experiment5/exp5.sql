--QUESTION 1--
DROP TABLE IF EXISTS transaction_data;
DROP VIEW IF EXISTS sales_summary;
DROP MATERIALIZED VIEW IF EXISTS sales_summary_mat;

CREATE TABLE transaction_data (
    id INT,
    value NUMERIC
);
INSERT INTO transaction_data (id, value)
SELECT id_series, ROUND((random()*1000)::numeric, 2)
FROM generate_series(1,2) AS id_series,
     generate_series(1,1000000) AS gs;
CREATE VIEW sales_summary AS
SELECT
    id,
COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
SUM(value)/COUNT(*) AS total_quantity_sold
FROM transaction_data
GROUP BY id;

CREATE MATERIALIZED VIEW sales_summary_mat AS
SELECT
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    SUM(value)/COUNT(*) AS total_quantity_sold
FROM transaction_data
GROUP BY id;

CREATE INDEX idx_sales_summary_mat_id ON sales_summary_mat(id);
EXPLAIN ANALYZE
SELECT * FROM sales_summary;
EXPLAIN ANALYZE
SELECT * FROM sales_summary_mat;
EXPLAIN ANALYZE
SELECT * FROM sales_summary_mat;


--QUESTION 2--

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    price NUMERIC,
    sale_date DATE
);

INSERT INTO sales (customer_name, product_name, quantity, price, sale_date)
VALUES
('Alice', 'Laptop', 2, 800, '2025-01-01'),
('Bob', 'Mouse', 5, 20, '2025-01-02'),
('Charlie', 'Keyboard', 3, 50, '2025-01-03'),
('Alice', 'Laptop', 1, 800, '2025-01-04');

DROP VIEW IF EXISTS sales_summary_view;
CREATE VIEW sales_summary_view AS
SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product_name;



DROP ROLE IF EXISTS reporting_team;

CREATE ROLE reporting_team LOGIN PASSWORD 'report123';
GRANT SELECT ON sales_summary_view TO reporting_team;

REVOKE ALL ON sales FROM reporting_team;
SELECT * FROM sales_summary_view;
SELECT * FROM sales;

