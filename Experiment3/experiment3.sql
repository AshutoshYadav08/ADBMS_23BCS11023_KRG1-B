



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



select max(emp_id) as Max_empid from employee2 where emp_id in
(select emp_id from employee2 group by emp_id having count(emp_id) < 2)

--------------------EXPERIMENT 03: (MEDIUM LEVEL)
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4,'SAM',60000,2),
(5,'MAX',90000,1)


---------------------SOLUTION------------------------------------
select *
from employee e
inner join department d
on e.department_id = d.id
where e.salary in
(  select max(e2.salary)
    from employee as e2
    where e2.department_id = d.id
) order by d.dept_name
------------------------------------------------------------------


--select 

--select max(salary) as [max salary],department_id,d.dept_name
--from employee e
--inner join department d
--on e.department_id = d.id
--group by department_id

--select from employee 



-------------------------------------EXPERIMENT 03: (HARD LEVEL)------

create table A(empdId int primary key,ename varchar(20),salary int);
insert into A(empdId,ename,salary) 
values (1,'AA',1000),
        (2,'BB',300)

create table B(empdId int primary key,ename varchar(20),salary int);
insert into B(empdId,ename,salary) 
values (2,'BB',400),
        (3,'CC',100)

select empdid,ename,min(salary) salary
from 
(select * from
A union all select * from B
) as intermediate_result group by empdID,ename

