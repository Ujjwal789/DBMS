-- Logical operators are used in SQL to filter records based on multiple conditions in the WHERE clause


-- AND → Returns records where both conditions are TRUE
-- OR → Returns records where at least one condition is TRUE
-- NOT → Negates a condition (returns the opposite result)

CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);


INSERT INTO employees (name, age, department, salary, city) VALUES
('Alice Johnson', 30, 'HR', 50000, 'New York'),
('Bob Smith', 25, 'IT', 70000, 'Los Angeles'),
('Charlie Brown', 35, 'IT', 80000, 'New York'),
('David Wilson', 40, 'Finance', 90000, 'Chicago'),
('Emily Davis', 28, 'HR', 48000, 'San Francisco'),
('Franklin Moore', 32, 'IT', 75000, 'Los Angeles'),
('Grace Adams', 45, 'Finance', 95000, 'Chicago');

select * from employees;
select * from employees where department = 'IT' and salary > 70000;
select * from employees where department = 'Hr' or city = 'New York';
select * from employees where department != 'finance';
select * from employees where (department = 'IT' and salary > 70000 ) or department = 'finance';
select * from employees where department = 'IT' and city != 'los angeles';