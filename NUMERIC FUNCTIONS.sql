
CREATE DATABASE NumericFunctionsDB;
USE NumericFunctionsDB;

CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10,5)
);

INSERT INTO numbers (num_value) VALUES
(25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);

select*from numbers;
select num_value, abs(num_value) as absolute_value from numbers;

select num_value,
 ceil(num_value) as round_up,
 floor(num_value) as round_down 
from numbers;
SELECT num_value, ROUND(num_value, 2) AS rounded_2_decimals FROM numbers;
SELECT num_value, TRUNCATE(num_value, 2) AS truncated_2_decimals FROM numbers;
-- Mathematical operations
select num_value, pow(num_value,2) as squre from numbers;
select num_value, mod(num_value,3) as reminder from numbers;
select num_value, sqrt(abs(num_value)) as squre_root from numbers;

-- Exponential and log functions with handling for out-of-range values
select exp(2);

	select num_value,
	case
	 when num_value >709 then 'to large '
	 else exp(num_value)
	 end as exp_value
	 from numbers;
     
select num_value,
log10(abs(num_value)+1) as log10,
log(abs(num_value)+1) as log
from numbers;

-- Pi constant and angle conversions
SELECT PI() AS pi_value;
SELECT num_value, 
       RADIANS(num_value) AS radians_value, 
       DEGREES(num_value) AS degrees_value 
FROM numbers;
-- Trigonometric functions
SELECT num_value, 
       SIN(num_value) AS sin_value, 
       COS(num_value) AS cos_value, 
       TAN(num_value) AS tan_value 
FROM numbers;

-- Bitwise operations
SELECT BIT_AND(num_value) FROM numbers;
SELECT BIT_OR(num_value) FROM numbers;
SELECT BIT_XOR(num_value) FROM numbers;
