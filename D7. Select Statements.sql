-- GROUP BY
-- LIKE
-- HAVING
-- BETWEEN
-- WILDCARD

use company;

-- BETWEEN --
-- used to return values in a given range
-- between is inclusive, both first and second values are included in the range
-- text, date, number

-- write a query returning all employees born on/between 1960-1980
select * from employee where bdate between '1960-01-01' and '1980-12-31';
select * from employee where year(bdate) between 1960 and 1980;

-- write a query returning all employees whot were NOT born on/between 1960-1980
select * from employee where bdate not between '1960-01-01' and '1980-12-31';
select * from employee where year(bdate) not between 1960 and 1980;

select * from employee where salary between 30000 and 45000;

-- in case you didn't want the values to be inclusive, operators can be used
select * from employee where salary>30000 and salary<45000;



-- GROUP BY --
-- group data based on similar values

-- display how many male and female employees exist
select count(*) as 'Total', sex from employee where sex is not null group by sex;

-- select highest salary for each gender
select max(salary) as 'Highest Salary', sex from employee where sex is not null group by sex;

-- display total amount of salaries for male & female employees separately
select sum(salary) as 'Total', sex from employee where sex is not null group by sex;

-- display average salary, lowest salaries and number of employees for each gender
select avg(salary) as 'Average Salary', min(salary) as 'MinSalary', count(*) from employee where sex is not null group by sex;


-- LIKE --
-- used when you are not certain on the exact data
-- it's like /help
-- using % it will return all similar results
-- is used to perform pattern matching in text data, to search for specific patterns/substrings within a text column
-- WILD CARD: allows you to use wildcards to create flexible pattern-matching conditions

-- LIKE: BASIC PATTERN MATCHING
-- display any employee who's name starts with J
select * from employee where fname like 'J%';

-- display any employee who's name ends with N
select * from employee where fname like '%N';

-- display any employee who's name starts and ends with A
select * from employee where fname like 'A%a';

-- LIKE: MATCHING SINGLE CHARACTERS
-- display any employee who's name start with J and is at least 5 characters in length
select * from employee where fname like 'J___%';
select * from employee where fname like 'J%' and length(fname)>=5;

-- select employees who has 'me' in their first name.
select * from employee where fname like '%me%';

-- LIKE: COMBINING WILD CARDS
-- select employees who's first name can be anything but should have 'oh' after first character.
select * from employee where fname like '_oh%';

-- display first name of employee which has 'Rames' and the last character can be anything.
select * from employee where fname like 'Rames_';

-- select record of Employee who is born in 1965.
select * from employee where bdate like '%1965%';
select * from employee where year (bdate)='1965';

-- display all employees who's first Name starts with A and ends with d.
select * from employee where fname like 'A%d';

-- display all employees who's first Name start with J and does not ends with n.
select * from employee where fname like 'J%' and first_name not like '%n';

-- display all employees who's first Name start with J and should be at least 5 characters in length.
select * from employee where fname like 'J____%';

-- select Employee who's full name start with 'Jennifer W';
select * from employee where concat(fname,' ',lname) like 'Jennifer W%';

-- case sensitive
select * from employee where fname like binary 'j%';


-- HAVING --
-- to specify filter conditions for a group of rows or aggregates
-- often used with the GROUP BY clause to filter groups based on a specified condition 
-- if you omit the GROUP BY clause, the HAVING clause behaves like the WHERE clause
-- the HAVING clause applies a filter condition to each group of rows
-- while the WHERE clause applies the filter condition to each individual row

-- find the salary which is being received by more than 2 employees
select salary, count(*) as 'No of Employee' from employee group by salary having count(*)>2;

-- find the total numner of employees for any gender which has more than 3 employees
select sex, count(*) as 'No of Employee' from employee group by sex having count(*)>3;

-- Display gender and total amount of salary for a gender where total amount of salary for specific gender is greater than 100000
select sex, sum(salary) as 'Total Salary' from employee group by sex having sum(salary)>100000;

-- Display avg salary and highest salary for any gender which has less than or equal to 3 employees.
select sex, avg(salary) as 'Average Salary' from employee group by sex having count(sex)<=3;



-- INSERT IGNORE --


select * from employee;