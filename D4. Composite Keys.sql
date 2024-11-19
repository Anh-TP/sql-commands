-- COMPOSITE KEYS --
-- adding composite keys when creating a table
create table employees_CK(
empID int,
empName varchar(30) not null,
empGender char (1) not null,
empManagerID int,
primary key (empID, empName)
);

-- 2. drop the composite key as a WHOLE =>
alter table employees_CK drop primary key;

-- 1. adding a composite key to an existing table => name, gender
alter table employees_CK add primary key (empID, empGender);

select * from information_schema.KEY_COLUMN_USAGE
where constraint_schema = 'bootcamp_2023' and table_name = 'employees_CK';

-- 3. drop a part of the composite key => name as the PK but not gender
alter table employees_CK drop primary key, add primary key (empID);

-- 4. to add CK to table where a PK already exists, then the PK must be dropped first and then readded

-- 5. adding a column to a table with composite key
alter table employees_CK add column empAge int;

select * from employees_CK;

-- ADDING AUTO INCREMENT

-- 1. how can you add auto_increment to a column e.g. empID
-- 2. can you add auto_increment to empManagerID column as well? 
-- Let's assume empID is a PK having auto_increment
-- 3. how can you remove the auto_increment from a PK column
-- 4. how can you remove a column having an auto-increment set on it
-- 5. how can you start the auto_increment from a number of your choice e.g. 80
