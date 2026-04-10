SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name = 'employees';
create table employees(
employee_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
hire_date date default (current_Date()),
email varchar(100) unique,
phone_number varchar(100) unique,
employee_salery decimal(10,2) check (employee_salery >0.0),
employee_status enum('active','On_leave', 'terminated' ) default 'active',
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp

);
insert into employees(
employee_id,
first_name,
last_name,
hire_date,
email,
phone_number,
employee_salery

)
values(
 456,
'donald',
'trump',
'2024-12-20',
'dolandtrump@fuckevanka',
'87987981654984',
 785555.656

);
insert into employees(
employee_id,
first_name,
last_name,
hire_date,
email,
phone_number,
employee_salery,
employee_status
)
values(
 4,
'donald',
'trump',
'2024-12-20',
'dolandtrump@fuckevankapussy',
'8798798121321',
 785555.656,
 'On_leave'

);
insert into employees(
first_name,
last_name,
hire_date,
email,
phone_number,
employee_salery,
employee_status,
departmnet_id
)
values(
'donald',
'trump',
'2024-12-20',
'dolandtskmump@sxmx',
'879812232321',
 788985.656,
 'On_leave',
  2
  );
DELETE FROM employees
WHERE employee_id = 8;


create table departmnet(
departmnet_id int primary key auto_increment,
departmnet_name varchar(100) not null,
location varchar(100),
hod varchar(50),
created_at timestamp default current_timestamp,
update_at timestamp default current_timestamp on update current_timestamp
);
insert into departmnet(departmnet_name, location, hod) values
('IT','A Block', 'sujit'),
('HR','B Block', 'ajit'),
('Sales','C Block', 'me');

alter table employees add foreign key(departmnet_id) references departmnet(departmnet_id);

select*from employees;
select*from departmnet;

drop table departmnet;




