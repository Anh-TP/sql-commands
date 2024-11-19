-- CASE STATEMENTS -- 
-- Additional expression that allows you to perform conditional logic within a query
-- It can be used to conditionally return a value based on one or more conditions.

USE Company;
SELECT * FROM Employee;

/*
Write a case expression which return employees full name salary with bonus as below:
  if salary is 1000 - 19000 increase 1000 
  if salary is 20000 - 29000 increase 2000
  if salary is 30000 - 39000 increase 3000
  if salary is 40000 - 49000 increase 4000
  if salary is 50000 - 59000 increase 5000
  if a person receive no salary then should display 'Not eligible for bonus'
*/

SELECT CONCAT(FNAME,' ',LNAME) AS 'Employee',SALARY,
CASE
WHEN SALARY>= 1000 AND SALARY<20000 THEN SALARY+1000
WHEN SALARY BETWEEN 20000 AND 29000 THEN SALARY+2000
WHEN SALARY BETWEEN 30000 AND 39000 THEN SALARY+3000
WHEN SALARY BETWEEN 40000 AND 49000 THEN SALARY+4000
WHEN SALARY BETWEEN 50000 AND 59000 THEN SALARY+5000
WHEN SALARY IS NULL THEN 'Not eligible for bonus'
END AS 'Salary with Bonus'

FROM Employee ORDER BY FNAME;

select * from employee;

-- add 'Position' column to the employee table 
alter table employee add column Position varchar(15);

-- then the position for all employees
SELECT CONCAT(FNAME,' ',LNAME) AS 'Employee',salary,
CASE
WHEN SALARY>= 1000 AND SALARY<20000 THEN 'Assistant'
WHEN SALARY BETWEEN 20000 AND 29000 THEN 'Junior'
WHEN SALARY BETWEEN 30000 AND 39000 THEN 'Manager'
WHEN SALARY BETWEEN 40000 AND 49000 THEN 'SeniorManager'
WHEN SALARY BETWEEN 50000 AND 59000 THEN 'CEO'
WHEN SALARY IS NULL THEN 'Not eligible for bonus'
END AS 'Role';

-- based on the position increase their salary
