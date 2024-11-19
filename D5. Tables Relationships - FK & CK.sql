-- TABLE RELATIONSHIPS
-- one-to-One (1:1) Relationship

-- one-to-Many (1:N) Relationship
-- a country to cities
-- cities to a country

-- many-to-Many (N:N) Relationship

-- self referencing

-- Describes the relationship between the tables in the relational database
-- It implies that one of the tables has a FK that references the PK of another (or smae) table How do we group and organise data
-- When we refer to table relationships, it means a foreign key should exist 
-- 1. Understand the relationships between tables
-- 2. Understand the data structures and data types with contraints

use bootcamp_2023;
show tables;


create table employee(
ID int primary key,
name varchar(40) not null
);
create table Salary(
empID int,
salaryAmount int
);
 
alter table salary add constraint fk_salary_employee
foreign key (empID) references employee(ID);\

--

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
