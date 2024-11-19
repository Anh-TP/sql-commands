-- CONSTRAINTS --

-- Applying constraints to column fields enable control and validity of the data entered. 
-- It prevents duplicates and creates valid data. Types of constrainst we can apply include:
-- 1. not null: cannot be left empty
-- 2. unique: ensures no 2 rows can have the same value
-- 3. primary key: unique identifiers => combines not null & unique
-- 4. check: enables checking the data to see if it meets a defined condition set i.e. min/max age range
-- 5. default: if value has not been provided it will use the default value specified
-- 6. foreign key: connects and links data from one table to another

show databases;
use bootcamp_2023;
show tables;

-- PRIMARY KEY --
-- this creates a table that yields valid data. This is considered best practice.
-- values inputted that do not meet the requirements defined by the constraints, it will throw an error
create table students1(
id int primary key,
first_name varchar(15) not null,
last_name varchar(15) not null,
age int,
check(age > 18),
subject varchar(15) unique,
city varchar(20) default 'London'
);

insert into students1 values
(001, 'Sarah', 'Lee', 20, 'Maths', 'London'),
(002, 'Jim', 'Bob', 19, 'Science', 'London'),
(003, 'John', 'Doe', 23, 'English', 'London'),
(004, 'Houston', 'Perry', 26, 'Poetry', 'London'),
(005, 'Kano', 'Parr', 24, 'Music', 'London'),
(006, 'Paris', 'Jackson', 19, 'Philosopy', 'London'),
(007, 'Michael', 'Horra', 19, 'AI', 'London'),
(008, 'Harry', 'Potter', 22, 'Fitness', 'London'),
(009, 'Jackson', 'Koni', 23, 'Art', 'London');

-- FOREIGN KEY --
-- links data in one table column into another table column
-- it's not possible to link 2 random columns data with another table, it must be a primary key defined from a table
create table persons (
personID int primary key,
lastName varchar(20) not null,
firstName varchar (20) not null,
age int);

insert into persons values
(001, 'Jane', 'Lee', 20),
(002, 'Jim', 'Bob', 19),
(003, 'Josh', 'Doe', 23),
(004, 'John', 'Perry', 54),
(005, 'Jason', 'Parr', 24),
(006, 'Janet', 'Jackson', 19),
(007, 'Julie', 'Horra', 19),
(008, 'Jerry', 'Potter', 22);

-- the pID column in orders table is linked with the personID column of persons table
-- the main table is the parent table and whatever is linking from it is the child table

create table orders (
orderID int primary key,
orderNo int not null,
pID int,
foreign key (pID) references persons (personID)
);

-- orders (child) ==> persons (parent)
desc persons;
desc orders;

-- to show which table a foreign key has been linked with you can access the key table from the information schema database and then further narrow down
select * from information_schema.KEY_COLUMN_USAGE
where constraint_schema = 'bootcamp_2023' and table_name = 'orders';

select * from students1;

-- AUTO INCREMENTING PKs --
-- auto incrementing = automatically incrementing the value of a column
-- by default it start from 1
-- the column must be a PK for auto incremennt to work
-- must have been defined as a key
-- only allows one column within a table to be auto incremented

create table test(
test_id int auto_increment primary key,
testName varchar(20) not null);

select * from test;