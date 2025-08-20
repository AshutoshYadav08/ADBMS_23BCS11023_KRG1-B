--------------EXPERIMENT 03 (SUB-QUERIES)-----------------------------
--------------EXPERIMENT 03: SUB-QUERIES-------


--INPUT TABLES:
CREATE TABLE MyEmployees (
    EmpId INT PRIMARY KEY IDENTITY(1,1),
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    City VARCHAR(50),
    Dept_id INT
);


INSERT INTO MyEmployees (EmpName, Gender, Salary, City, Dept_id)
VALUES
('Amit', 'Male', 50000, 'Delhi', 2),
('Priya', 'Female', 60000, 'Mumbai', 1),
('Rajesh', 'Male', 45000, 'Agra', 3),
('Sneha', 'Female', 55000, 'Delhi', 4),
('Anil', 'Male', 52000, 'Agra', 2),
('Sunita', 'Female', 48000, 'Mumbai', 1),
('Vijay', 'Male', 47000, 'Agra', 3),
('Ritu', 'Female', 62000, 'Mumbai', 2),
('Alok', 'Male', 51000, 'Delhi', 1),
('Neha', 'Female', 53000, 'Agra', 4),
('Simran', 'Female', 33000, 'Agra', 3);


create table dept(
	id int unique not null, 
	Dept_Name varchar(20) not null
)

insert into dept values(1, 'Accounts');
insert into dept values(2, 'HR');
insert into dept values(3, 'Admin');
insert into dept values(4, 'Counselling');




/*
		Q1 (Q2 (Q3) - INNER QUERIES/NESTED QUERIES) - 
		MAIN QUERY / OUTER QUERY

		9 IN (10,25,88)

		EXECUTION ORDER:
		Q3 -> Q2 -> Q1

		SUB-QUERY: QUERY INSIDE A QUERY / NESTED QUERIES

		MAIN OPERATORS USED WITH SQ:
			0. = : USED TO COMPARE ONE VALUE: 9, AMAN, 
			1. IN: MULTIPLE VALUES : WHERE CITY IN ('A','B')
			2. NOT IN:
			4. ANY
			5. ALL




		TYPES OF SUB-QUERIES:
		1. SCALER SQ: WHICH RETURN ONLY ONE VALUE: 9, AMAN
			OPEARTORS: <,>, <=, >= != (<>)
		
		2. MULTI-VALUED SQ / MULTI-ROW: MULITIPLE VALUES / ROWS
			OPERATORS: IN, NOT IN, ANY , ALL

		3. SELF-CONTAINED SQ: THESE ARE NOT DEPENDENT ON OUTER QUERY
					Q1 (Q2)
		4. CO-RELATED SQ: THESE ARE DEPENDENT ON OUTER QUERY
				Q1 (Q2)
				IF I RUN Q2 SEPERATELY, IT WILL GIVE ERROR
*/

--USE SUB_QUERIES

--ANY AND ALL OPERATOR WITH SUB-QUERIES
-- [ANY OPERATOR] - its like OR
select *from MyEmployees 
where Salary < ANY
(Select Salary from MyEmployees where EmpName = 'Amit' or EmpName = 'Anil') --result (50000, 54000)
--eg: it returns 50000,54000, now it will compare from both the output of SQ one by one.
--will return all rows where salary is less then 50000 or salary is less than 54000












-- [ALL OPERATOR] - its like AND
select *from MyEmployees 
where Salary < ALL
(Select Salary from MyEmployees where EmpName = 'Amit' or EmpName = 'Anil') --result (50000, 54000)

SELECT *FROM MyEmployees
-- FIND THE SECOND HIGHEST SALARY FROM EMP RELATION
--1. FIND THE MAX SALARY - 78000
--2. FIND THE MAX SALARY : (NOT INCLUDE 78000)

--AGG FUN: AVG, SUM , COUNT, MIN, MAX
SELECT MAX(SALARY) AS [2ND_HIGHEST] FROM MyEmployees WHERE SALARY !=
(SELECT MAX(SALARY) FROM MyEmployees) --62000

SELECT *FROM MyEmployees
SELECT *FROM DEPT

--SCALER SUB-QUERY (REPLACEMENT ON JOIN) --JOIN 2 TABLES BY SQ

--1. SQ IN WHERE CLAUSE
--2. SQ IN SELECT COMMAND
--3. SQ IN FROM CLAUSE

SELECT *FROM MyEmployees
WHERE DEPT_ID IN 
(SELECT ID FROM DEPT WHERE DEPT_NAME = 'Accounts')


--MULTI-ROW / MULTI-VALUED SQ:
SELECT *FROM MyEmployees
WHERE EMPNAME IN
(SELECT EMPNAME FROM MyEmployees WHERE GENDER ='Female')


--SELF-CONTAINED SQ:
SELECT *FROM MyEmployees
WHERE DEPT_ID IN 
(SELECT ID FROM DEPT WHERE DEPT_NAME = 'Accounts')

--CO-RELATED SQ
/*
	1. ALIAS ARE VERY MUCH USED WITH CO-RELATED SQ
	2. IT IS NOT MUCH USED, AS IT HAS A LOT OF OVERHEAD
	
*/


SELECT *FROM MyEmployees AS E
WHERE E.DEPT_ID IN
(SELECT D.ID FROM DEPT AS D WHERE E.GENDER ='Female')

--EXPERIMENT 3
---EASY QUESTION

create table employee2(emp_id int);

insert into employee2 (emp_id) 
values 
		(2),
		(4),
		(4),
		(6),
		(6),
		(7),
		(8),
		(8)



select max(emp_id) from employee2 where emp_id in
--(select distinct(emp_id) from employee2)
(select emp_id from employee2 group by emp_id having count(emp_id) < 2)




-------------------PRACTICE SET----------------
CREATE TABLE TBL_PRODUCTS
(
	ID INT PRIMARY KEY IDENTITY,
	[NAME] NVARCHAR(50),
	[DESCRIPTION] NVARCHAR(250) 
)

CREATE TABLE TBL_PRODUCTSALES
(
	ID INT PRIMARY KEY IDENTITY,
	PRODUCTID INT FOREIGN KEY REFERENCES TBL_PRODUCTS(ID),
	UNITPRICE INT,
	QUALTITYSOLD INT
)

INSERT INTO TBL_PRODUCTS VALUES ('TV','52 INCH BLACK COLOR LCD TV')
INSERT INTO TBL_PRODUCTS VALUES ('LAPTOP','VERY THIIN BLACK COLOR ACER LAPTOP')
INSERT INTO TBL_PRODUCTS VALUES ('DESKTOP','HP HIGH PERFORMANCE DESKTOP')


INSERT INTO TBL_PRODUCTSALES VALUES (3,450,5)
INSERT INTO TBL_PRODUCTSALES VALUES (2,250,7)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,4)
INSERT INTO TBL_PRODUCTSALES VALUES (3,450,9)


SELECT *FROM TBL_PRODUCTS
SELECT *FROM TBL_PRODUCTSALES

select id,name,DESCRIPTION from TBL_PRODUCTS where id not in 
(select distinct PRODUCTID  from TBL_PRODUCTSALES)


select 
(select sum(QUALTITYSOLD) from TBL_PRODUCTSALES where TBL_PRODUCTSALES.id = TBL_PRODUCTS.id) 
from 
TBL_PRODUCTS;




------------- SET OPERATION IN DATABASES----------------------

CREATE TABLE FootballParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE HockeyParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);




INSERT INTO FootballParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Jane', 'jane.smith@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('David', 'david.wilson@example.com');


INSERT INTO HockeyParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Patricia', 'patricia.taylor@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('Kevin', 'kevin.martinez@example.com');


SELECT *FROM  FootballParticipants
SELECT *FROM  HockeyParticipants

/*
		SET? -> TABLE

		1. UNION
		2. UNION ALL
		3. INTERSECT (INNER JOIN)
		4. (A-B): EXCEPT


		RESTRICTION:
			1. THE NO COLUMNS IN INVOLVING RELATION SHOULD BE SAME (STRICLTY SAME)
			2. DATATYPES OF THESE COL MUST HAVE TO BE SAME


			EG: 
			
			SELECT *FROM A
			UNION
			SELECT *FROM B

			SELECT ID, NAME FROM A
			UNION
			SELECT NAME, ID FROM B


			SELECT ID, NAME FROM A
			UNION
			SELECT DECIMAL, ID FROM B

*/

SELECT *FROM  FootballParticipants
SELECT *FROM  HockeyParticipants

--UNION: UNION REMOVING DUPLICATES


SELECT *FROM  FootballParticipants
UNION
SELECT *FROM  HockeyParticipants


--UNION ALL
SELECT *FROM  FootballParticipants
UNION ALL
SELECT *FROM  HockeyParticipants