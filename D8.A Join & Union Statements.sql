-- UNION
-- JOIN, TYPE JOIN

use company;

create table Instructor(
instructorID int primary key,
instructorName varchar(20));

create table Trainer(
trainerID int primary key,
trainerName varchar(20),
trainerAge int);

select * from instructor;

insert into Instructor (instructorID, instructorName) values
(1, 'Abdul'), (2, 'Mark'), (3, 'Zak'), (4, 'Sandra');

insert into Trainer (trainerID, trainerName, trainerAge) values
(1, 'Abdul', 35), (2, 'Zak', 28), (3, 'Waqas', 38);
 
 
-- UNION -- 
-- used to combine the result sets of two or more SELECT statements. 
-- it is useful when we want to generate reports with data from separate tables and databases
-- union all returns all data whilst union will remove duplicates from the dataset

 select instructorName from instructor 
 union all
 select trainerName from trainer;
 
 select instructorName from instructor 
 union 
 select trainerName from trainer
 union
 select id from bootcamp_2023.employee;
 
 -- JOIN --
 -- used to combine records from two or more tables based on a related column between them 
 -- left join, right join
 
 -- INNER JOIN --
 -- returns only the rows with matching values in both tables. returns the intersection of the two tables.
 
 -- OUTER JOIN --
 -- returns all the rows from both tables, incl. the unmatched rows
 -- 3 types of OUTER JOIN: LEFT OUTER JOIN, RIGHT OUTER JOIN, and FULL OUTER JOIN.
 
 -- LEFT JOIN
 -- returns all rows from the left table and the matching rows from the right table
 -- if there are any unmatched rows in the right table, they will be filled with NULL values
 
  -- Display all employees name and their department name
select fname, lname, dname from employee left join department on dno=dnumber;


 -- RIGHT JOIN
 -- returns all the rows from the right table and the matching rows from the left table
 -- if there are any unmatched rows in the left table, they will be filled with NULL values
 
-- Department name and number of employees working in that department
SELECT DNAME, COUNT(*) FROM Employee INNER JOIN Department ON DNO=DNUMBER GROUP BY DNAME;

SELECT FNAME, LNAME, HOURS, PNAME FROM Employee LEFT JOIN Works_ON
ON Employee.SSN=Works_On.ESSN 
INNER JOIN Project ON Works_On.PNO=Project.PNUMBER;
     
     
-- CROSS JOIN -- 

-- SELF JOIN --
-- joining a table back to itself 

SELECT * FROM Department;
DROP DATABASE  IF EXISTS UnionDB;
CREATE DATABASE UnionDb;
use UnionDb;
CREATE TABLE Instructor(instructorId INT PRIMARY KEY, instructorName VARCHAR(15));
CREATE TABLE Trainer(trainerId INT PRIMARY KEY, trainerName VARCHAR(15), trainerAge INT);

INSERT INTO Instructor (instructorId, instructorName) 
VALUES (5,'Ender'),(6,'Simon'),(3,'Zak'),(4,'Sandra');
INSERT INTO Trainer (trainerId, trainerName, trainerAge) VALUES
(4,'Anita',35),(5,'Walid',28),(3,'Waqas',38);

SELECT instructorId AS 'ID', instructorName AS 'Name'  FROM Instructor
UNION 
SELECT trainerId, trainerName FROM Trainer;
-- Union is useful when we want to annual generat report where we have seperated table
	-- for each month report

-- Join in MySQL
-- INNER Join -- select common data from both table
-- Syntax
	-- SELECT column1, column2 FROM table1 INNER JOIN table2 ON column=column
SELECT * FROM Instructor INNER JOIN Trainer ON instructorName=trainerName;

-- LEFT JOIN 
-- all the data from the left table will be selected from the right table
		-- only data will be selected which common between them
        
SELECT * FROM Instructor LEFT JOIN Trainer ON instructorName=trainerName;

SELECT * FROM Instructor RIGHT JOIN Trainer ON instructorName=trainerName;

-- Display all employees name and thier department name
SELECT FNAME, LNAME, DNAME FROM Employee LEFT JOIN Department ON DNO=DNUMBER;

-- Department name and number of employees working in that department
	SELECT DNAME, COUNT(*) FROM Employee INNER JOIN Department 
    ON DNO=DNUMBER GROUP BY DNAME;
    -- 
    SELECT FNAME, LNAME, HOURS, PNAME FROM Employee LEFT JOIN Works_ON
    ON Employee.SSN=Works_On.ESSN 
     INNER JOIN Project ON Works_On.PNO=Project.PNUMBER;
     
     /* Cross join will select all data from both table in a way where each row
	of each table will join with each row of the other table
-- the work of cross join is similar to inner join
*/

use uniondb;
SELECT * FROM Instructor CROSS JOIN trainer ON trainerName=instructorName;

-- Select all department names and thier locations
	SELECT DNAME, DLOCATION FROM Department LEFT JOIN Dept_Locations
		ON Department.DNUMBER=Dept_Locations.DNUMBER;
-- select all department names and projects names of each department
	SELECT DNAME, PNAME FROM Department LEFT JOIN Project ON DNUMBER=DNUM;
-- select all employees and thier dependent names
	SELECT CONCAT(FNAME,' ', LNAME) AS 'Employee', Dependent_Name 
		FROM Employee LEFT JOIN Dependent ON SSN=ESSN;
/* retrieve Employee Full Name and total amount of hours for an 
employee who is working less than 40 hours. */
SELECT CONCAT(FNAME,' ',LNAME) AS 'Employee', SUM(HOURS) AS 'Total Hours'
FROM Employee LEFT JOIN Works_On ON ESSN=SSN GROUP BY SSN HAVING SUM(HOURS)<40;


-- Self Join => when we join a table back to itself is called self join
-- We should always temporary rename a table in self
USE Company;
SELECT * FROM Employee;

-- 
-- SELF JOIN => when we join a table back to itself.
USE Company;
SELECT * FROM Employee;
-- Display full name of all employees and thier manager names
SELECT CONCAT(e.FNAME,' ',e.LNAME) AS 'Employee', CONCAT(m.FNAME,' ',m.LNAME) AS 'Manager'
	FROM Employee AS e LEFT JOIN Employee AS m ON e.SUPERSSN=m.SSN;

-- Display all employees name and thier department name
	SELECT emp.FNAME, emp.LNAME, dep.DNAME FROM Employee emp LEFT JOIN department dep ON emp.DNO=dep.DNUMBER;

-- !Learning Objectives
    -- Exploring String functions in MySQL
    -- Exploring Date functions in MySQL Join
    -- Being able to effectively use string and date functions
-- CONCAT() -- concatenate two more string or columns
-- TRIM() -- remove expra spaces from left and right
SELECT TRIM('           Zak           ') as Name;
-- LTRIM()
-- RTRIM()
	SELECT LTRIM('       Zak                     ') AS Name;
 -- UCASE()/UPPER()
 -- LOWER()/LCASE()
	SELECT UPPER(FNAME) FROM Employee;

/*
Select full name of all employees
1. it should in upper case
2. extra spaces should be removed
*/
SELECT UPPER(CONCAT(TRIM(FNAME),' ',TRIM(LNAME))) FROM Employee;

-- DATABASE() -- will return the current selected database;
-- SUBSTRING() => extract text from a string
-- string, from which character to start, how many character to be extracted
SELECT SUBSTRING('Database',3); 
-- Display first name of all employee and make sure it's in sentence case
SELECT * FROM Employee;
SELECT CONCAT(UPPER(SUBSTRING(FNAME,1,1)), LOWER(SUBSTRING(FNAME,2))) AS 'First Name' FROM Employee;
SELECT CURRENT_USER();
SELECT USER();


-- 
-- String Methods
-- date methods
-- self join
-- rename database in MySQL => backup and restoring a database
-- Mysqldump