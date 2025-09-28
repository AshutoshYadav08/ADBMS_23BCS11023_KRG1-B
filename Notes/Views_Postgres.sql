--------------------------VIEW IN POSTGRES SQL--------------------------------
/*
    1. VIEW IS A DATABASE OBJECT
    2. VIEW IS CREATED OVER AN SQL QUERY
    3. VIEW DOES NOT STORE ANY DATA 
    4. VIEW IS LIKE A VIRTUAL TABLE
    5. DATA ABSTRACTION
    6. SECURITY : ROW LEVEL & COLUMN LEVEL SECURITY

	WHY VIEW?
    




	
    tables for testing:
    -- ===========================
-- 1. Create customer_master
-- ===========================
CREATE TABLE customer_master (
    customer_id VARCHAR(5) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(50),
    city VARCHAR(30)
);

-- ===========================
-- 2. Create product_catalog
-- ===========================
CREATE TABLE product_catalog (
    product_id VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    brand VARCHAR(30),
    unit_price NUMERIC(10,2) NOT NULL
);

-- ===========================
-- 3. Create sales_orders
-- ===========================
CREATE TABLE sales_orders (
    order_id SERIAL PRIMARY KEY,
    product_id VARCHAR(5) REFERENCES product_catalog(product_id),
    quantity INT NOT NULL,
    customer_id VARCHAR(5) REFERENCES customer_master(customer_id),
    discount_percent NUMERIC(5,2),
    order_date DATE NOT NULL
);



INSERT INTO customer_master (customer_id, full_name, phone, email, city) VALUES
('C1', 'Amit Sharma', '9876543210', 'amit.sharma@example.com', 'Delhi'),
('C2', 'Priya Verma', '9876501234', 'priya.verma@example.com', 'Mumbai'),
('C3', 'Ravi Kumar', '9988776655', 'ravi.kumar@example.com', 'Bangalore'),
('C4', 'Neha Singh', '9123456789', 'neha.singh@example.com', 'Kolkata'),
('C5', 'Arjun Mehta', '9812345678', 'arjun.mehta@example.com', 'Hyderabad'),
('C6', 'Sneha Reddy', '9090909090', 'sneha.reddy@example.com', 'Chennai'),
('C7', 'Vikram Das', '9123412345', 'vikram.das@example.com', 'Pune'),
('C8', 'Rohit Gupta', '9000000001', 'rohit.gupta@example.com', 'Lucknow'),
('C9', 'Pooja Nair', '9898989898', 'pooja.nair@example.com', 'Kochi'),
('C10', 'Ankit Yadav', '9345678901', 'ankit.yadav@example.com', 'Ahmedabad');



INSERT INTO product_catalog (product_id, product_name, brand, unit_price) VALUES
('P1', 'Smartphone X100', 'Samsung', 25000.00),
('P2', 'Laptop Pro 15', 'Dell', 65000.00),
('P3', 'Wireless Earbuds', 'Sony', 5000.00),
('P4', 'Smartwatch Fit', 'Apple', 30000.00),
('P5', 'Tablet 10.5', 'Lenovo', 22000.00),
('P6', 'Gaming Console', 'Sony', 45000.00),
('P7', 'Bluetooth Speaker', 'JBL', 7000.00),
('P8', 'Digital Camera', 'Canon', 55000.00),
('P9', 'LED TV 55 inch', 'LG', 60000.00),
('P10', 'Power Bank 20000mAh', 'Mi', 2500.00);



INSERT INTO sales_orders (product_id, quantity, customer_id, discount_percent, order_date) VALUES
('P1', 2, 'C1', 5.00, '2025-09-01'),
('P2', 1, 'C2', 10.00, '2025-09-02'),
('P3', 3, 'C3', 0.00, '2025-09-03'),
('P4', 1, 'C4', 8.00, '2025-09-04'),
('P5', 2, 'C5', 5.00, '2025-09-05'),
('P6', 1, 'C1', 12.00, '2025-09-06'),
('P7', 2, 'C2', 0.00, '2025-09-07'),
('P8', 1, 'C3', 10.00, '2025-09-08'),
('P9', 1, 'C6', 15.00, '2025-09-09'),
('P10', 4, 'C7', 0.00, '2025-09-10'),
('P1', 1, 'C8', 5.00, '2025-09-11'),
('P2', 2, 'C9', 10.00, '2025-09-12'),
('P3', 2, 'C10', 0.00, '2025-09-13'),
('P4', 1, 'C5', 8.00, '2025-09-14'),
('P5', 3, 'C6', 5.00, '2025-09-15'),
('P6', 1, 'C7', 12.00, '2025-09-16'),
('P7', 2, 'C8', 0.00, '2025-09-17'),
('P8', 1, 'C9', 10.00, '2025-09-18'),
('P9', 1, 'C10', 15.00, '2025-09-19'),
('P10', 5, 'C4', 0.00, '2025-09-20');

*/






   -- ===========================
-- 1. Create customer_master
-- ===========================
CREATE TABLE customer_master (
    customer_id VARCHAR(5) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(50),
    city VARCHAR(30)
);

-- ===========================
-- 2. Create product_catalog
-- ===========================
CREATE TABLE product_catalog (
    product_id VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    brand VARCHAR(30),
    unit_price NUMERIC(10,2) NOT NULL
);

-- ===========================
-- 3. Create sales_orders
-- ===========================
CREATE TABLE sales_orders (
    order_id SERIAL PRIMARY KEY,
    product_id VARCHAR(5) REFERENCES product_catalog(product_id),
    quantity INT NOT NULL,
    customer_id VARCHAR(5) REFERENCES customer_master(customer_id),
    discount_percent NUMERIC(5,2),
    order_date DATE NOT NULL
);



INSERT INTO customer_master (customer_id, full_name, phone, email, city) VALUES
('C1', 'Amit Sharma', '9876543210', 'amit.sharma@example.com', 'Delhi'),
('C2', 'Priya Verma', '9876501234', 'priya.verma@example.com', 'Mumbai'),
('C3', 'Ravi Kumar', '9988776655', 'ravi.kumar@example.com', 'Bangalore'),
('C4', 'Neha Singh', '9123456789', 'neha.singh@example.com', 'Kolkata'),
('C5', 'Arjun Mehta', '9812345678', 'arjun.mehta@example.com', 'Hyderabad'),
('C6', 'Sneha Reddy', '9090909090', 'sneha.reddy@example.com', 'Chennai'),
('C7', 'Vikram Das', '9123412345', 'vikram.das@example.com', 'Pune'),
('C8', 'Rohit Gupta', '9000000001', 'rohit.gupta@example.com', 'Lucknow'),
('C9', 'Pooja Nair', '9898989898', 'pooja.nair@example.com', 'Kochi'),
('C10', 'Ankit Yadav', '9345678901', 'ankit.yadav@example.com', 'Ahmedabad');



INSERT INTO product_catalog (product_id, product_name, brand, unit_price) VALUES
('P1', 'Smartphone X100', 'Samsung', 25000.00),
('P2', 'Laptop Pro 15', 'Dell', 65000.00),
('P3', 'Wireless Earbuds', 'Sony', 5000.00),
('P4', 'Smartwatch Fit', 'Apple', 30000.00),
('P5', 'Tablet 10.5', 'Lenovo', 22000.00),
('P6', 'Gaming Console', 'Sony', 45000.00),
('P7', 'Bluetooth Speaker', 'JBL', 7000.00),
('P8', 'Digital Camera', 'Canon', 55000.00),
('P9', 'LED TV 55 inch', 'LG', 60000.00),
('P10', 'Power Bank 20000mAh', 'Mi', 2500.00);



INSERT INTO sales_orders (product_id, quantity, customer_id, discount_percent, order_date) VALUES
('P1', 2, 'C1', 5.00, '2025-09-01'),
('P2', 1, 'C2', 10.00, '2025-09-02'),
('P3', 3, 'C3', 0.00, '2025-09-03'),
('P4', 1, 'C4', 8.00, '2025-09-04'),
('P5', 2, 'C5', 5.00, '2025-09-05'),
('P6', 1, 'C1', 12.00, '2025-09-06'),
('P7', 2, 'C2', 0.00, '2025-09-07'),
('P8', 1, 'C3', 10.00, '2025-09-08'),
('P9', 1, 'C6', 15.00, '2025-09-09'),
('P10', 4, 'C7', 0.00, '2025-09-10'),
('P1', 1, 'C8', 5.00, '2025-09-11'),
('P2', 2, 'C9', 10.00, '2025-09-12'),
('P3', 2, 'C10', 0.00, '2025-09-13'),
('P4', 1, 'C5', 8.00, '2025-09-14'),
('P5', 3, 'C6', 5.00, '2025-09-15'),
('P6', 1, 'C7', 12.00, '2025-09-16'),
('P7', 2, 'C8', 0.00, '2025-09-17'),
('P8', 1, 'C9', 10.00, '2025-09-18'),
('P9', 1, 'C10', 15.00, '2025-09-19'),
('P10', 5, 'C4', 0.00, '2025-09-20');



-- SELECT * FROM customer_master;
-- SELECT * FROM product_catalog;
-- SELECT * FROM sales_orders;

SELECT 
    O.order_id,
    O.order_date,
    P.product_name,
    C.full_name,
    (P.unit_price * O.quantity) - ((P.unit_price * O.quantity) * O.discount_percent / 100) AS final_cost
FROM customer_master AS C
JOIN sales_orders AS O 
    ON O.customer_id = C.customer_id
JOIN product_catalog AS P
    ON P.product_id = O.product_id;




--lets say you have written a query, which actually calulates the total order summary on a daily basis
/*
	for that you will write a sql query and you will give that query to the client so that client can execute it to see the summary.
	PROBLEM: in the sql query everything is visible and your client can access anything (confidential information) like tables, columns, schema etc which you never want.

	to resolve this what we can do is:
	1. create view

	
*/

CREATE VIEW vW_ORDER_SUMMARY
AS
SELECT 
    O.order_id,
    O.order_date,
    P.product_name,
    C.full_name,
    (P.unit_price * O.quantity) - ((P.unit_price * O.quantity) * O.discount_percent / 100) AS final_cost
FROM customer_master AS C
JOIN sales_orders AS O 
    ON O.customer_id = C.customer_id
JOIN product_catalog AS P
    ON P.product_id = O.product_id;


--ACCESSING THE VIEW
SELECT * FROM vW_ORDER_SUMMARY;
-- STILL WE THE CLIENT CAN ACCESS THE CONTENTS OF THE TABLE BY ACCESSING THE SCRIPT FROM LEFT SIDE OBJECT EXPLORER
-- IN THAT CASE, WE WILL USE ACCESS RIGHTS - CREATE USER FOR CLIENT - AND WILL GIVE PERMISSION TO THE CLIENT

--APPLYING THE ACCESS RIGHTS TO THE VIEW FOR THE CLIENT

--1. CREATE USER
CREATE ROLE ALOK
LOGIN
PASSWORD 'alok';
--now instead of sharing the credentials of my database to the client, i'll share with the specific user 'ALOK' in this case
/*
	open new query window -> connect to new user / sign in as new user
	and in that query window try to access the newly created view

	this will give error

	now we will giev access to the client
*/

GRANT SELECT ON vW_ORDER_SUMMARY TO ALOK;
--client will only be able to do the select, no alteration, and he can not see the sql
REVOKE SELECT ON vW_ORDER_SUMMARY FROM ALOK;




create table random_tabl (id int, val decimal)

insert into random_tabl 
select 1, random() from generate_series(1,1000000);


insert into random_tabl 
select 2, random() from generate_series(1,1000000);



--normal execution
select id, avg(val), count(*)
from random_tabl
group by id;


--execution by materialized view
create materialized view mv_random_tabl
as
select id, avg(val), count(*)
from random_tabl
group by id;

select *from mv_random_tabl


--if you update anything in table, the mv doesn't gets updated
---for that we have to refresh it

refresh materialized view mv_random_tabl;
 
















------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------EXPERIMENT 05 (MEDIUM LEVEL)------------------------------

CREATE TABLE transaction_data (
    id INT,
    value INT
);


-- For id = 1
INSERT INTO transaction_data (id, value)
SELECT 1, random() * 1000  -- simulate transaction amounts 0-1000
FROM generate_series(1, 1000000);

-- For id = 2
INSERT INTO transaction_data (id, value)
SELECT 2, random() * 1000
FROM generate_series(1, 1000000);

SELECT *FROM transaction_data



--WITH NORMAL VIEW
CREATE OR REPLACE VIEW sales_summary_view AS
SELECT
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    AVG(value) AS avg_transaction
FROM transaction_data
GROUP BY id;


EXPLAIN ANALYZE
SELECT * FROM sales_summary_view;



--WITH MATERIALIZED VIEW
CREATE MATERIALIZED VIEW sales_summary_mv AS
SELECT
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    AVG(value) AS avg_transaction
FROM transaction_data
GROUP BY id;



EXPLAIN ANALYZE
SELECT * FROM sales_summary_mv;









create table random_tabl (id int, val decimal)

insert into random_tabl 
select 1, random() from generate_series(1,1000000);


insert into random_tabl 
select 2, random() from generate_series(1,1000000);



--normal execution
select id, avg(val), count(*)
from random_tabl
group by id;


--execution by materialized view
create materialized view mv_random_tabl
as
select id, avg(val), count(*)
from random_tabl
group by id;

select *from mv_random_tabl


--if you update anything in table, the mv doesn't gets updated
---for that we have to refresh it

refresh materialized view mv_random_tabl;














--------------------------------------------EXPERIMENT 05 (HARD LEVEL)------------------------------
CREATE VIEW vW_ORDER_SUMMARY
AS
SELECT 
    O.order_id,
    O.order_date,
    P.product_name,
    C.full_name,
    (P.unit_price * O.quantity) - ((P.unit_price * O.quantity) * O.discount_percent / 100) AS final_cost
FROM customer_master AS C
JOIN sales_orders AS O 
    ON O.customer_id = C.customer_id
JOIN product_catalog AS P
    ON P.product_id = O.product_id;


	--ACCESSING THE VIEW
SELECT * FROM vW_ORDER_SUMMARY;
-- STILL WE THE CLIENT CAN ACCESS THE CONTENTS OF THE TABLE BY ACCESSING THE SCRIPT FROM LEFT SIDE OBJECT EXPLORER
-- IN THAT CASE, WE WILL USE ACCESS RIGHTS - CREATE USER FOR CLIENT - AND WILL GIVE PERMISSION TO THE CLIENT

--APPLYING THE ACCESS RIGHTS TO THE VIEW FOR THE CLIENT

--1. CREATE USER
CREATE ROLE ALOK
LOGIN
PASSWORD 'alok';
--now instead of sharing the credentials of my database to the client, i'll share with the specific user 'ALOK' in this case
/*
	open new query window -> connect to new user / sign in as new user
	and in that query window try to access the newly created view

	this will give error

	now we will giev access to the client
*/

GRANT SELECT ON vW_ORDER_SUMMARY TO ALOK;
--client will only be able to do the select, no alteration, and he can not see the sql
REVOKE SELECT ON vW_ORDER_SUMMARY FROM ALOK;



CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', 'Sales');
INSERT INTO EMPLOYEE VALUES (0002, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE VALUES (0003, 'Ava', 'Sales');

select *from employee;

CREATE VIEW vW_STORE_SALES_DATA
AS
	SELECT EMPID, NAME, DEPT 
	FROM EMPLOYEE
	WHERE DEPT = 'Sales'
	WITH CHECK OPTION;

SELECT *FROM vW_STORE_SALES_DATA;

INSERT INTO vW_STORE_SALES_DATA(EMPID, NAME, DEPT) VALUES (5, 'Aman', 'Admin'); --VIOLATION CONDITION

















