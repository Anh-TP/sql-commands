-- RELATIONSHIPS
-- Describes the relationship between the tables in the relational database
-- Implies that a table has a FK that references the PK of another (or same) table

-- One-to-One (1:1) 
-- One-to-Many (1:N) / Many-to-One (N:1)
-- Many-to-Many (N:N)
-- Self Referencing

-- 1. Understand the relationships between tables
-- 2. Understand the data structures and data types with contraints

use bootcamp_2023;
show tables;

-- Implementing: One-to-One (1:1) --
-- When each row on T1 has only 1 related row in T2 e.g. a citizen with a passport or a student ID
-- Create 2 tables with a simple PK-FK relationship between them
-- Set the FK to be unique & not null

create table employee(
ID int primary key,
name varchar(40) not null
);

create table salary(
empID int unique not null,
salaryAmount int
);
 
alter table salary add constraint fk_salary_employee
foreign key (empID) references employee(ID);

select * from information_schema.key_column_usage 
where constraint_schema = 'bootcamp_2023'
and table_name = 'salary';

desc salary;
desc employee;

select * from salary;
select * from employee;

-- Implementing: One-to-Many 
create table city(
city_id int primary key,
city varchar(40) not null,
country_id int not null
);
 
create table country(
  country_id int primary key,
    contry varchar(40) not null
);

desc city;
desc country;
 
alter table city add constraint fk_city_country 
foreign key (country_id) references country (country_id);


create table films(
film_id int primary key,
title varchar(40) not null,
director varchar(40) not null,
year_released datetime
);
 
create table category (
category_id int primary key,
name varchar(50)
);
 
create table film_category(
film_id int,
category_id int,
primary key (film_id, category_id),
constraint fk_film foreign key (film_id) references films (film_id),
constraint fk_category foreign key (category_id) references category (category_id)
);

create table staff(
  empID int primary key,
    empFullName varchar(60) not null,
    empAge int not null,
    managerID int not null,
    foreign key (managerID) references staff(empID)
);
