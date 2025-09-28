--QUESTION - 1 --
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    gender VARCHAR(10)
);

INSERT INTO employees (emp_name, gender) VALUES
('Aarav Sharma', 'Male'),
('Neha Verma', 'Female'),
('Rohan Gupta', 'Male'),
('Priya Singh', 'Female'),
('Kunal Mehta', 'Male');

CREATE OR REPLACE PROCEDURE get_employee_count_by_gender(IN p_gender VARCHAR, OUT p_count INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COUNT(*) INTO p_count
    FROM employees
    WHERE gender = p_gender;
    RAISE NOTICE 'Total number of % employees: %', p_gender, p_count;
END;
$$;
CALL get_employee_count_by_gender('Male', NULL);
DO $$
DECLARE 
    result INT;
BEGIN
   CALL get_employee_count_by_gender('Female', result);
    RAISE NOTICE 'Captured result: % Female employees', result;
END $$;

--QUESTION - 2 --
CREATE TABLE product(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price NUMERIC(10,2),
    quantity_remaining INT,
    quantity_sold INT DEFAULT 0
);

INSERT INTO product(product_name, price, quantity_remaining) VALUES
('Smartphone', 20000.00, 10),
('Laptop', 55000.00, 5),
('Tablet', 30000.00, 8);

CREATE TABLE sale(
    sale_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(product_id),
    quantity_ordered INT,
    total_price NUMERIC(10,2),
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE PROCEDURE place_order(IN p_product_id INT, IN p_quantity INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_price NUMERIC(10,2);
    v_remaining INT;
    v_total NUMERIC(10,2);
BEGIN
 SELECT price, quantity_remaining INTO v_price, v_remaining
    FROM product
    WHERE product_id = p_product_id;
    IF NOT FOUND THEN
        RAISE NOTICE 'Invalid product ID!';
        RETURN;
END IF;
    IF v_remaining >= p_quantity THEN
        v_total := v_price * p_quantity;

        INSERT INTO sale(product_id, quantity_ordered, total_price)
        VALUES (p_product_id, p_quantity, v_total);

 UPDATE product
        SET quantity_remaining = quantity_remaining - p_quantity,
            quantity_sold = quantity_sold + p_quantity
        WHERE product_id = p_product_id;

        RAISE NOTICE 'Product sold successfully!';
    ELSE
        RAISE NOTICE 'Insufficient Quantity Available!';
    END IF;
END;
$$;
CALL place_order(1, 2);
SELECT * FROM products;
SELECT * FROM sales;

