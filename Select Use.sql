create database company;
use company;

create table employee(
id int  primary key auto_increment,
first_name varchar (50),
last_name varchar (50),
department varchar(100),
salery decimal(10,2),
hire_date date
);
INSERT INTO employee (first_name, last_name, department, salery, hire_date) VALUES
('John', 'Doe', 'HR', 60000.00, '2022-05-10'),
('Jane', 'Smith', 'IT', 75000.00, '2021-08-15'),
('Alice', 'Johnson', 'Finance', 82000.00, '2019-03-20'),
('Bob', 'Williams', 'IT', 72000.00, '2020-11-25'),
('Charlie', 'Brown', 'Marketing', 65000.00, '2023-01-05');

select*from employee;
select first_name as 'First Name', last_name, department from employee;
select * from employee where department = "IT" Order by salery desc limit 1; 
select distinct department from employee;
select first_name , salery*1.1 as 'salery Incriment' from employee;
select concat( first_name , " ",last_name) as ' full NAME', year(hire_date), round( salery ,1) as 'salery'from employee where salery >70000 order by hire_date desc  ;
select avg(salery) from employee;
select * from employee where salery >(select avg(salery) from employee);
select first_name as 'First Name', last_name as 'last name' from employee where department = 'IT' union
select first_name as 'First Name', last_name as 'last name' from employee where department = 'HR';
select count(*) , department from employee group by department;

