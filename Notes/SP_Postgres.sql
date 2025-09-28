-----------Stored Procedures in Postgres-------------
/*
	what is a procedure?
	purpose of using a procedure
	how to creat a stored procedure
	procedure with parameters
	procedure without parameters
	how to execute a procedure?


	A stored Procedure can include;
	- SQL QUERIES
	- DML, DDL, DCL, AND TCL COMMANDS
	- CURSORS
	- LOOPS, CONDITIONAL STATEMENTS
	- EXCEPTIONAL HANDLING ETC

	- MULTIPLE QUERIES BUILD INSIDE A SINGLE UNIT - STORE PROCEDURE

*/

















--SYNTAX OF STORED PROCEDURE

CRAETE OR REPLACE PROCEDURE PROCEURE_NAME (P_parameter_01 VARCHAR, P_parameter_02 INT)
LANGUAGE PLPGSQL
AS
$$
DECLARE
   VARIABLES 
BEGIN
   PROCEDURE BODY 
END; 
$$



--WHY $$






CREATE TABLE employee_info (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO employee_info (id, name, gender, salary, city)
VALUES
(1, 'Alok', 'Male', 50000.00, 'Delhi'),
(2, 'Priya', 'Male', 60000.00, 'Mumbai'),
(3, 'Rajesh', 'Female', 45000.00, 'Bangalore'),
(4, 'Sneha', 'Male', 55000.00, 'Chennai'),
(5, 'Anil', 'Male', 52000.00, 'Hyderabad'),
(6, 'Sunita', 'Female', 48000.00, 'Kolkata'),
(7, 'Vijay', 'Male', 47000.00, 'Pune'),
(8, 'Ritu', 'Male', 62000.00, 'Ahmedabad'),
(9, 'Amit', 'Female', 51000.00, 'Jaipur');













-------------PROCEDURES WITHOUT PARAMETERS-------------------------

CREATE OR REPLACE PROCEDURE SP_GETDETAILS ()
LANGUAGE PLPGSQL
AS
$$
BEGIN
      RAISE NOTICE 'HELLO THIS IS SQL POSTGRES';
END;
$$

CALL SP_GETDETAILS ();






-------------TO GET ONLY THE SINGLE RECORD-----------------
CREATE OR REPLACE PROCEDURE SP_GET_DETAILS () 
LANGUAGE PLPGSQL
AS
$$
DECLARE 
 	V_ID INT;
 	V_NAME VARCHAR(20);
 	V_SALARY INT;
BEGIN
 	SELECT ID, NAME, SALARY INTO V_ID, V_NAME, V_SALARY
 	FROM employee_info;

	RAISE NOTICE 'ID IS %, NAME IS %, SALARY IS %', v_id, v_name, v_salary;
END;
$$

CALL SP_GET_DETAILS();








-------------------------PROCEDURE WITH PARAMETERS--------------------
CREATE OR REPLACE PROCEDURE sp_get_employee_by_id(IN p_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_id INT;
    v_name VARCHAR(50);
    v_gender VARCHAR(10);
    v_salary NUMERIC(10,2);
    v_city VARCHAR(50);
BEGIN
    
    SELECT id, name, gender, salary, city
    INTO v_id, v_name, v_gender, v_salary, v_city
    FROM employee_info
    WHERE id = p_id;

    -- Check if a record was found
    IF NOT FOUND THEN
        RAISE NOTICE 'No employee found with ID: %', p_id;
    ELSE
        RAISE NOTICE 'Employee Details -> ID: %, Name: %, Gender: %, Salary: %, City: %',
                     v_id, v_name, v_gender, v_salary, v_city;
    END IF;
END;
$$;

CALL sp_get_employee_by_id(3);








---------------TO GET MULTIPLE RECORDS--------------- (FETCHING ALL THE RECORDS FROM TABLE WITH SP)
CREATE OR REPLACE PROCEDURE sp_get_details_01()
LANGUAGE plpgsql
AS $$
DECLARE
    v_id INT;
    v_name VARCHAR(20);
    v_salary INT;
BEGIN
    FOR v_id, v_name, v_salary IN (SELECT id, name, salary FROM employee_info) LOOP
        RAISE NOTICE 'ID: %, NAME: %, SALARY: %', v_id, v_name, v_salary;
    END LOOP;
END;
$$;


CALL sp_get_details_01();

















-------------------------EXPERIMENT 06 (MEDIUM LEVEL)------------------------------
--INPUT TABLES: 
CREATE TABLE employee_info (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO employee_info (name, gender, salary, city)
VALUES
('Alok', 'Male', 50000.00, 'Delhi'),
('Priya', 'Male', 60000.00, 'Mumbai'),
('Rajesh', 'Female', 45000.00, 'Bangalore'),
('Sneha', 'Male', 55000.00, 'Chennai'),
('Anil', 'Male', 52000.00, 'Hyderabad'),
('Sunita', 'Female', 48000.00, 'Kolkata'),
('Vijay', 'Male', 47000.00, 'Pune'),
('Ritu', 'Male', 62000.00, 'Ahmedabad'),
('Amit', 'Female', 51000.00, 'Jaipur');


--SOLUTION
CREATE OR REPLACE PROCEDURE sp_get_employees_by_gender(
    IN p_gender VARCHAR(50),
    OUT p_employee_count INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Count total employees by gender
    SELECT COUNT(id)
    INTO p_employee_count
    FROM employee_info
    WHERE gender = p_gender;

    -- Display the result
    RAISE NOTICE 'Total employees with gender %: %', p_gender, p_employee_count;
END;
$$;


CALL sp_get_employees_by_gender('Male', NULL);
















-------------------------EXPERIMENT 06 (HARD LEVEL)------------------------------

--INPUT TABLES: 

CREATE TABLE products (
    product_code VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    quantity_remaining INT NOT NULL,
    quantity_sold INT DEFAULT 0
);

CREATE TABLE sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    product_code VARCHAR(10) NOT NULL,
    quantity_ordered INT NOT NULL,
    sale_price NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (product_code) REFERENCES products(product_code)
);

INSERT INTO products (product_code, product_name, price, quantity_remaining, quantity_sold)
VALUES
('P001', 'iPHONE 13 PRO MAX', 109999.00, 10, 0),
('P002', 'Samsung Galaxy S23 Ultra', 99999.00, 8, 0),
('P003', 'iPAD AIR', 55999.00, 5, 0),
('P004', 'MacBook Pro 14"', 189999.00, 3, 0),
('P005', 'Sony WH-1000XM5 Headphones', 29999.00, 15, 0);

INSERT INTO sales (order_date, product_code, quantity_ordered, sale_price)
VALUES
('2025-09-15', 'P001', 1, 109999.00),
('2025-09-16', 'P002', 2, 199998.00),
('2025-09-17', 'P003', 1, 55999.00),
('2025-09-18', 'P005', 2, 59998.00),
('2025-09-19', 'P001', 1, 109999.00);

SELECT * FROM PRODUCTS;
SELECT * FROM SALES;


---SOLUTION:

CREATE OR REPLACE PROCEDURE pr_buy_products(
    IN p_product_name VARCHAR,
    IN p_quantity INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    v_product_code VARCHAR(20);
    v_price FLOAT;
    v_count INT;
BEGIN 

    -- Step 1: Check if product exists and has enough quantity
    SELECT COUNT(*)
    INTO v_count
    FROM products 
    WHERE product_name = p_product_name 
    AND quantity_remaining >= p_quantity;

    -- Step 2: If sufficient stock
    IF v_count > 0 THEN 

        -- Fetch product code and price
        SELECT product_code, price 
        INTO v_product_code, v_price
        FROM products 
        WHERE product_name = p_product_name;

        -- Insert a new record into the sales table
        INSERT INTO sales (order_date, product_code, quantity_ordered, sale_price)
        VALUES (CURRENT_DATE, v_product_code, p_quantity, (v_price * p_quantity));

        -- Update stock details
        UPDATE products 
        SET quantity_remaining = quantity_remaining - p_quantity,
            quantity_sold = quantity_sold + p_quantity
        WHERE product_code = v_product_code;

        -- Confirmation message
        RAISE NOTICE 'PRODUCT SOLD..! Order placed successfully for % unit(s) of %.', p_quantity, p_product_name;

    ELSE 
        -- Step 3: If stock is insufficient
        RAISE NOTICE 'INSUFFICIENT QUANTITY..! Order cannot be processed for % unit(s) of %.', p_quantity, p_product_name;
    END IF;
END;
$$;


CALL pr_buy_products ('MacBook Pro 14"', 1);



























































