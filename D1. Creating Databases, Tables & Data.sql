-- DATABASES --

-- create database [database_name];
create database bootcamp_2023;

show databases;

use bootcamp_2023;

-- accessing a different database and specific table
select * from database_name.table_name;

-- TABLES --
show tables;

 -- table created below will yield invalid data types as there is not primary key, this is not considered best practice
create table students(
id int,
first_name varchar(15),
last_name varchar(15)
);

-- access the table structure
desc students;
explain students;

-- access the table data/values
select * from students;

-- inserting data into a table

-- A. you need to provide values for all the columns (inserting into one row)
-- by executing the the below query mutliple times, the values will continue to add to new rows without restrictions because it is invalid data without a primary key
insert into students values (101, 'Narayan', "Khosla");

-- if the number of values provided does not match the table column structure it will throw an error:
-- column count does not match the value at row count
insert into students values (101, 'Narayan');

-- if the value inserted doesn't match the data type defined within the column, it will throw an error
-- Error Code: 1366. Incorrect integer value: 'Chris' for column 'stu_id' at row 1
insert into student values ('Chris', 'Smith', 23);

-- B. adding values into specific columns only i.e. when you don't have values for all columns available
insert into students (id, first_name) values (23, 'Chris');
insert into students (first_name, last_name) values ('Joey', 'Badass');

-- deleting all data inside a table
truncate students;

-- inserting multiple data in a table
-- remember to terminate with semi-colon delimiter
-- a. providing values for all columns
insert into students values
(101, 'Sarah', 'a'),
(102, 'David', 'b'),
(101, 'Cardi', 'Jo'),
(103, 'Coral', 'o'),
(104, 'Jim', 'r');

-- b. inserting values into specific columns only
insert into students (id, last_name) values
(101, 'Sarah'),
(102, 'David'),
(101, 'Cardi'),
(103, 'Coral'),
(104, 'Jim');

select * from students;