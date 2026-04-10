-- order_by.sql
/*
SQL Sorting and ORDER BY Tutorial
================================
This SQL script demonstrates various techniques for sorting data using ORDER BY
and includes examples ranging from basic to advanced sorting concepts.
*/

-- Section 1: Database and Table Setup
-- ----------------------------------
create database d12;
use d12;

create table products(
   product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);
insert into products values
(1, 'Laptop Pro', 'Electronics', 1299.99, 50, '2024-01-15 10:00:00'),
(2, 'Desk Chair', 'Furniture', 199.99, 30, '2024-01-16 11:30:00'),
(3, 'Coffee Maker', 'Appliances', 79.99, 100, '2024-01-14 09:15:00'),
(4, 'Gaming Mouse', 'Electronics', 59.99, 200, '2024-01-17 14:20:00'),
(5, 'Bookshelf', 'Furniture', 149.99, 25, '2024-01-13 16:45:00');

-- Section 2: Basic Sorting Operations
-- ---------------------------------
-- Display all records (unsorted

SELECT * FROM products;
-- Sort by price in ascending order (ASC is optional as it's the default)
select*from products order by price asc;
select*from products order by price  desc;

-- Section 3: Advanced Sorting Techniques
-- ------------------------------------

-- Multiple column sorting (sort by category descending, then price descending)
select*from products order by category , price desc ;
-- Sort using column position (4 represents the price column)
select*from products order by 4 asc;
-- Combining WHERE clause with ORDER BY
select*from products 
where stock_quantity <100
and category = 'furniture' order by price desc;
-- Case-sensitive sorting using BINARY
SELECT * FROM products ORDER BY BINARY category;

-- Section 4: Function-Based Sorting
-- -------------------------------
select product_name, length(product_name) from products order by length(product_name);
select * from products order by length(product_name);
select * from products order by time(last_updated);
SELECT * FROM products 
ORDER BY stock_quantity DESC 
LIMIT 1;

-- Section 5: Custom Sorting Orders
-- -----------------------------
-- Default category sorting By Field
SELECT * FROM products ORDER BY category;
SELECT * FROM products
ORDER BY FIELD(category,'Furniture','Appliances','Electronics'), price desc;

-- Coustom sorting by help of case 
select*,
stock_quantity <= 50 AND price >= 200 AS priority
from products
order by(stock_quantity <=50 and price>=200);

select*,
case
when stock_quantity <=50 and price>=200 then 1
when stock_quantity <50 then 2
else 3
end AS imp
from products order by price desc;

-- Section 7: Handling NULL Values
-- ----------------------------
-- Add records with NULL values for demonstration
INSERT INTO products VALUES
(6, 'Desk Lamp', 'Furniture', NULL, 45, '2024-01-18 13:25:00'),
(7, 'Keyboard', 'Electronics', 89.99, NULL, '2024-01-19 15:10:00');

-- Basic NULL handling in ORDER BY
SELECT * FROM products ORDER BY price;

-- Explicit NULL handling
SELECT *,stock_quantity is null FROM products ORDER BY stock_quantity desc;

-- Section 8: Working with Calculated Columns
-- --------------------------------------
-- Sort by total value (price * quantity)
SELECT *, price * stock_quantity AS total_value 
FROM products 
ORDER BY total_value DESC;

explain SELECT *, price * stock_quantity AS total_value 
FROM products 
ORDER BY total_value DESC;


-- Compare with primary key sort performance
EXPLAIN SELECT * FROM products 
ORDER BY product_id;


