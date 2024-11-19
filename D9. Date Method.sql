-- ---------------- Date Method        ------------------
-- NOW()/CURRENT_TIMESTAMP() -- Return current date and time
SELECT NOW();
-- CURRENT_DATE()/ CURDATE() -- Return current date
SELECT CURRENT_DATE();
-- CURRENT_TIME()/CURTIME() => Return current time
SELECT CURRENT_TIME();

-- MONTHNAME() 	=> return month name from a date
-- Return current month name
SELECT MONTHNAME(CURDATE());
-- DAYNAME() => return day name from a date
-- Display today name
SELECT DAYNAME(CURDATE());
SELECT DAYNAME('2022-11-07');
SELECT YEAR('2022-11-07');
SELECT YEAR(curdate());

-- Thursday, 9th of November 2023
SELECT CONCAT(DAYNAME(CURDATE()),', ' ,DAY(CURDATE()),'th of ',MONTHNAME(CURDATE()),' ',
YEAR(CURDATE())) AS 'Today Date';

-- Nested Queries
-- when we write a query inside another 
	-- breakdown your query into multiple query
-- Display all those employees records who receive highest salary.
	-- break dwon query
		-- to find highest
        -- find who receive salary
	-- SELECT MAX(SALARY) FROM Employee;
    -- SELECT * FROM Employee WHERE SALARY=MaxSalary
    SELECT * FROM Employee WHERE SALARY=(SELECT MAX(SALARY) FROM Employee);
    
-- display all employees who are working in Rearch department
	-- SELECT DNUMBER FROM Department WHERE DNAME='Research';
   --  SELECT * FROM Employee WHERE DNO=departmentNumberOfResearch;
SELECT * FROM Employee WHERE DNO IN(SELECT DNUMBER FROM Department WHERE DNAME='Research');

-- -- display all employees who are working in Rearch or Administration department
SELECT DNUMBER FROM Department WHERE DNAME='Research' OR DNAME='Administration';
SELECT * FROM Employee WHERE DNO IN(
SELECT DNUMBER FROM Department WHERE DNAME='Research' OR DNAME='Administration');

-- SELECT (SELECT MAX(SALARY)),SEX FROM Employee GROUP BY SEX;
SELECT * FROM dept_locations;

-- Display all employees name who's supervisor is 'Jennifer Wallace';
	-- SELECT SSN FROM Employee WHERE FNAME='Jennifer' AND LNAME='Wallace';
   -- SELECT FNAME, LNAME FROM Employee WHERE SUPERSSN=ssnOfJenniferWallace
   SELECT FNAME, LNAME FROM Employee WHERE SUPERSSN=
   (SELECT SSN FROM Employee WHERE FNAME='Jennifer' AND LNAME='Wallace');
-- Display any department which is located in Houston or Stafford
	SELECT DNAME FROM department WHERE DNUMBER IN(
		SELECT DNUMBER FROM dept_locations WHERE DLOCATION='Houston' OR DLOCATION='Stafford');
-- Increase the salary of all employees by 10% of thier salary
	SELECT FNAME, LNAME, SALARY+(SALARY*10/100) FROM Employee;



CREATE DATABASE CompanyNewDatabase;
