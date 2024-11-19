-- SELECT STATEMENTS --
-- Limit
-- Sorting Data: Order By .... ASC/DESC ....
-- Alias: AS
-- CONCAT
-- IN
-- Aggregate Functions: AVG(), MAX(), MIN(), COUNT()

use company;


-- SELECT STATEMENTS -- 
-- Syntax: SELECT col1, col2, FROM tableName
select * from Employee;
select fname, lname from Employee;
select fname, lname, salary from Employee;



-- LIMIT --
-- limit number of rows/records to be displayed
select * from employee limit 3; -- will display to the top 3 records

-- display 4 records after the first 3 records 
select * from employee limit 4 offset 3; 



-- SELECTING SPECIFIC RECORDS
-- display any employee who's first name is 'John' - filter
select * from employee where fname='John';
select * from employee where salary>2500 and salary <40000;
select * from employee where salary>2500 and sex='F';


-- Display fname, lname, address, and salary of all employees
select fname, lname, address, salary from Employee;

-- display all information of female employees
select * from employee where sex='F';

-- display all employees who receive more than 30000 salary;
select * from employee where salary>30000;

-- display all male employees who receive less than 30000 salary;
select * from employee where sex='m' and salary>30000;

select * from employee where fname='Jennifer' and (lname='Wallace' or salary=43000);
-- display all info about employees who's gender is F or M with a salary above 30000
select * from employee where (sex='M' or sex='F') and salary=300000;



-- SORTING DATA IN MYSQL --
-- Syntax: ORDER BY
-- Ascending: ASC - the default in mysql
-- Descending: DESC
-- WHERE should always come first to set the condition

select * from employee order by fname asc;
select * from employee order by lname desc;

select * from employee order by salary asc;
select * from employee order by salary desc;

-- select an employee who is receiving highest salary
select * from employee order by salary desc limit 1;

-- select an employee who is receiving lowest salary
select * from employee order by salary asc limit 1;

-- select an employee who is receiving lowest salary omit any employees who's salary is null
select * from employee where salary>0 order by salary asc limit 1;
select * from employee where salary is not null order by salary asc limit 1;

-- select top five employess who are receiving highest salary
select * from employee order by salary desc limit 5;

-- select top five employees who is receiving lowest salary;
select * from employee order by salary asc limit 5;

-- select female employee who is receiving highest salary
select * from Employee where SEX='F' order by SALARY desc limit 1;

-- select male employee who is receiving lowest salary
select * from Employee where SEX='M' order by SALARY asc limit 1;



-- ALIAS --
-- sytnax: AS --
-- to rename columns in the result set
select fname as 'First Name', lname as 'Last Name', salary from employee;



-- CONCAT --
-- used to concatenate two strings and columns
-- display full name and salary of all employees
select concat(fname,' ',lname) as 'Full Name', salary from employee;



-- IN --
-- select any employee who's fname is John, Franklin or Ahmad
select * from Employee where fname='John' or fname='Franklin' or fname='Ahmad';
select * from Employee where fname in ('John', 'Franklin','Ahmad');

-- select any employee who's fname IS NOT John, Franklin or Ahmad
select * from Employee where fname not in ('John', 'Franklin','Ahmad');



-- AGGREGATE FUNCTIONS --
-- AVG()
-- SUM()
-- MAX()
-- MIN()
-- COUNT()


-- SUM()
-- what is the total amount of all employees salary
select sum(salary) from employee;

-- display total amount of salaries for female employees.
select sum(salary) as 'Total Salary of All Female Employees' from employee where sex='F';


-- COUNT()
-- Display the total amount of records in employee
select count(*) as 'Total no. of Employee' from employee;
select count(salary) as 'Total no. of Employee' from employee;

-- count all distinct/unique salaries paid to employees
select count(distinct salary) from employee;


-- MAX()
-- what is the maximum salary you pay to an employee
select max(salary) as 'Maximum Salary' from employee;


-- MIN()
-- display maximum and minimum salary that you pay to your employee
select max(salary) as 'Maximum Salary', min(salary) as 'Minimum Salary' from employee;


-- AVG ()
-- display average of all employees salaries.
select avg(salary) as 'Average Salary' from employee;

select * from Employee;


