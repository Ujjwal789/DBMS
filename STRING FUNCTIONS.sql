create database StringfunctionDb;
use StringfunctionDb;

create table employees(
id int auto_increment primary key,
first_name varchar(50),
last_name varchar(100),
email  varchar (100) unique,
department VARCHAR(50)
);

insert into employees(first_name, last_name, email, department) values
('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');

select concat(first_name, " ",last_name) as full_name from employees;
select first_name, length(first_name) as length from employees;
select first_name,
 upper(first_name) as uppercase,
 lower(first_name) as lower
 from employees;
 
 select 1+1; -- use as expression evaluate
 
 select trim(upper("   ok  ")) as sample;
 

 select first_name, substring(first_name, 1,3) as first_three from employees; 
 select first_name, locate("e",first_name) as position from employees;  
 select first_name, locate("ch",first_name) as position from employees; 
 
  select first_name, email, replace(email, 'example.com', 'amazon.com') as replaced from employees;

-- REVERSE: Reverse the characters in first names
SELECT first_name, REVERSE(first_name) AS reversed_name FROM employees;

-- LEFT and RIGHT: Get the first two and last two characters of first names
SELECT first_name, 
       LEFT(first_name, 2) AS first_two, 
       RIGHT(first_name, 2) AS last_two 
FROM employees;

-- ASCII: Get ASCII value of the first character in first names (regular and lowercase)
SELECT first_name, 
       ASCII(first_name) AS ascii_value, 
       ASCII(LOWER(first_name)) AS ascii_lowercase_value 
FROM employees;


-- Create products database for FIELD function demonstration
CREATE DATABASE db12;
USE db12;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);

-- Insert sample product data
INSERT INTO products VALUES
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

-- FIELD: Order products by category in custom order
SELECT *, 
       FIELD(category, 'Electronics', 'Appliances', 'Furniture') AS category_order 
FROM products 
ORDER BY FIELD(category, 'Electronics', 'Appliances', 'Furniture') DESC;

-- LENGTH vs CHAR_LENGTH: Demonstrate difference with ASCII and multibyte characters
SELECT LENGTH('hello') AS length_in_bytes;          -- Returns 5 (bytes)
SELECT LENGTH('こんにちは') AS multibyte_length;      -- Returns more than 5 because each character is multiple bytes
SELECT CHAR_LENGTH('hello') AS char_count;          -- Returns 5 (characters)
SELECT CHAR_LENGTH('こんにちは') AS multibyte_char_count; -- Returns 5 (characters)

-- SOUNDEX: Compare phonetically similar strings
SELECT SOUNDEX('Smith') AS smith_soundex;  -- Returns 'S530'
SELECT SOUNDEX('Smyth') AS smyth_soundex;  -- Also returns 'S530'
SELECT SOUNDEX('Robert') AS robert_soundex; -- Returns 'R163'
SELECT SOUNDEX('Rupert') AS rupert_soundex; -- Also returns 'R163'

-- Find employees with names that sound like "Jane"
SELECT * FROM employees WHERE SOUNDEX('jane') = SOUNDEX(first_name);


 



