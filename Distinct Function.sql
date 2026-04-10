create database EmployeeDB;
USE EmployeeDB;

create table employees(
id int auto_increment primary key,
name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10,2)
);

-- Insert sample data including duplicates
INSERT INTO employees (name, department, salary) VALUES
    ('Alice', 'HR', 50000),
    ('Bob', 'Finance', 60000),
    ('Charlie', 'IT', 70000),
    ('Alice', 'HR', 50000),      -- Duplicate record
    ('David', 'Finance', 55000),
    ('Eve', 'IT', 70000),        -- Duplicate salary
    ('Frank', 'HR', 50000);      -- Duplicate department & salary
    
    select * from employees;
    select distinct department from  employees;
    -- using distinct multliple coloumn
    select distinct department, salary from  employees;
	select count(distinct department) as unique_deparment from  employees;

select distinct salary as unique_salary from  employees order by  salary desc;
select distinct concat(name, " ",department) as dp from employees;
select distinct department from employees where salary > 50000;

insert into employees(name, department, salary) VALUES
    ('Grace', NULL, 48000),
    ('Bobby', NULL, 48000);