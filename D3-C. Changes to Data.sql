-- MAKING CHANGES TO DATA --
-- insert
-- update
-- delete 
-- where

use bootcamp_2023;
desc persons;
desc orders;
use bootcamp_2023;

select * from orders;

-- UPDATING DATA --

-- updating data in a single column cell 
update orders set orderNo = 675765 where orderID = 400;
update orders set orderNo = 384778 where orderID = 100;

-- updating multiple columns 
update students1 
set age = 34, city = 'Liverpool', last_name = 'Kelly' where id = 4;


-- DELETING DATA --

-- deleting a row from table
delete from students1 where id = 3;

select * from students1;

-- DELETING DATA WHERE A FK EXISTS --

-- ON DELETE CASCADE
-- When a record in the parent table is deleted, all related records in the child table are automatically deleted as well
-- This is useful when you want to ensure that all related data is removed to maintain referential integrity

-- ON DELETE SET NULL
-- When a record in the parent table is deleted, the FK column in the child table is set to NULL for all related records.
-- This is useful when you want to nullify references to the deleted record without deleting the child records.

create table Country(
id int primary key auto_increment, 
name varchar(10));

insert into Country (name) values('UK'),('USA'),('Germany');

create table City(
cityId int primary key, 
cityName varchar(10), 
countryId int,
foreign key (countryId) references Country(id) on delete set null);

insert into City values(1,'London',1),(2,'Manchester',1),(3,'New York',2),(4,'Berlin',3);

desc country;
select * from Country;
select * from City;

delete from Country where name='UK';


-- logical operators OR AND
update students1 set age = 39 where id = 113 or subject = 'History'; -- we do not have any record that has the id of 113 and history subject at the same time

-- accessing a different database & finding out the foreign keys set
select * from information_schema.KEY_COLUMN_USAGE
where constraint_schema = 'bootcamp_2023' and table_name = 'orders';

-- adding data to a table where a foreign key exists
-- FK constraint ensure referential integrity
-- adding new data to a child table that is connected with a parent foreign key from another table
-- the data entered into that specific column must match and correspond to that off the parent table column otherwise it will throw an error
insert into orders values (600, 758758787, 017); -- will not work
insert into orders values (400, 757857858, 007);

select * from orders;

-- tables and data cannot just be changed, added, deleted, dropped where a foreign key data exists
-- to make changes: any constraints to data must be removed first so there are no dependencies and then it can be removed
-- for example the below is not possible
delete from persons where personID = 001; -- error thrown to maintain referential integrity
drop table person; -- error thrown to maintain referential integrity

-- **IMPORTANT
-- in case you mess up remove the tables in this order, 1. orders 2. person **, then run the above create queries in the order 1. person 2. orders **
drop table orders;
drop table person;