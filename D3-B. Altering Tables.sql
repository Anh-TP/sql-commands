-- ADDING, DELETING, MODIFYING TABLES & STURCTURE --
-- to add/delete/modify columns including PK & FK constraints
-- alter table
-- add column
-- after
-- modify column
-- rename column
-- add primary/foreign key
-- drop primary/foreign key
-- auto_increment: auto-incrementing in an existing table


use bootcamp_2023;
show tables;

create table customers(
cust_id int,
cust_name varchar(30));

desc customers;



-- ADDING TABLE COLUMNS --

-- a. adding a column to an exisitng table. columns will always be added to the end
alter table customers add column cust_age int;

-- b. adding a column at a specific position:
-- add cust_subject before the cust_age
alter table customers add column cust_subject varchar(20) after cust_name;

-- c. adding a column at the beginning of a table
-- cust_gender before cust_id column
alter table customers add column cust_gender char(1)  first;

-- d. adding multiple columns in one query
-- cust_city, cust_county, cust_postCode
alter table customers 
add column cust_city varchar(10),
add column cust_county varchar(10),
add column cust_postCode varchar(7);



-- DELETING TABLE COLUMNS --

-- e. drop a column from the table
alter table customers drop column cust_gender;

-- f. drop multiple columns from the table
alter table customers 
drop column cust_county,
drop column cust_subject;



-- MODIFYING DATA --

-- g. change a column that takes null to not null
alter table customers modify column cust_name varchar(30) not null;

select * from customers;

-- i. change the data type of a column => cust_name from v30 to v40
alter table customers modify column cust_name varchar(40);

-- j. change the name of an existing column => cust_name to customer_name
alter table customers rename column customer_fullName to cust_name;



-- CHANGES TO PRIMARY KEYS --

-- l. add a PK to a table
alter table customersNew add primary key (cust_id);

-- m. remove a PK from a table
alter table customersNew drop primary key;

select * from customersNew;



-- CHANGES TO FOREIGN KEYS --

create table employees (
empID int primary key,
empName varchar(30) not null,
empGender char (1) not null,
empManagerID int,
foreign key (empManagerID) references employees(empID)
);

-- n. add a FK to a table
alter table employees add foreign key (empManagerID) references employees (empID);
-- adding a FK with a constraint name
-- alter table employees add constraint personalised_FK foreign key (empManagerID) references employees (empID);

desc employees;

-- o. drop a FK from a table - need to use the FK constraint name to be dropped and not the foreign key column name
show create table employees;
alter table employees drop foreign key employees_ibfk_3;

select * from information_schema.key_column_usage where constraint_schema = 'bootcamp_2023'
and table_name = 'employees';



-- CHANGES TO COMPOSITE KEYS --

-- when you have a table made up of 2 or more primary keys, the primary key DT cannot be written after the column name
-- purpose of primary Key (PK), whether it is a Composite  Primary Key (CPK) (made of two coumns or more) or made of one column (PK), 
-- is to identify a unique row in the table. Example of CPK (post_code, Street_number).  so it is always a ONE Unique record (row). ALWAYS Unique identifier

-- 1. adding composite keys when creating a table
create table employees_CK(
empID int,
empName varchar(30) not null,
empGender char (1) not null,
empManagerID int,
primary key (empID, empName)
);

-- 2. drop the composite key as a WHOLE =>
alter table employees_CK drop primary key;

-- 3. adding a composite key to an existing table => name, gender
alter table employees_CK add primary key (empID, empGender);

select * from information_schema.KEY_COLUMN_USAGE
where constraint_schema = 'bootcamp_2023' and table_name = 'employees_CK';

-- 4. drop a part of the composite key => name as the PK but not gender
alter table employees_CK drop primary key, add primary key (empID);

-- 5. to add CK to table where a PK already exists, then the PK must be dropped first and then readded

-- 6. adding a column to a table with composite key
alter table employees_CK add column empAge int;

select * from employees_CK;



-- ADDING AUTO INCREMENT --

-- 1. how can you add auto_increment to a column e.g. empID
alter table employees_CK modify column empID int primary key auto_increment;

-- 2. can you add auto_increment to empManagerID column as well? 
-- no because auto_increment can only be applied to one column

-- Let's assume empID is a PK having auto_increment
-- 3. how can you remove the auto_increment from a PK column
alter table employees_CK modify column empID int;

-- 4. how can you remove a PK column having an auto-increment set on it?
-- remove the auto-increment first and then drop PK
alter table employees_CK drop column empID;

-- 5. how can you start the auto_increment from a number of your choice e.g. 80
alter table employees_CK modify column empID int auto_increment, auto_increment = 80;

insert into employees_CK (empName, empGender) values ('test', 'M');

select * from employees_CK;
