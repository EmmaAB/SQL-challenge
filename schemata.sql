--Check that tables do not already exist; drop tables that already exist. 
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

--Create a table for departments with their number and name, using dept_no as the primary key. 
CREATE TABLE departments (
dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL);

--Check departments table
select * from departments;

--Create a table for employee's titles and the title id number, using title_id as the primary key. 
CREATE TABLE titles (
title_id VARCHAR(5) NOT NULL PRIMARY KEY,
title VARCHAR(20) NOT NULL);

--Check titles table
select * from titles;

--Create a table of all employees 
--Include employee number, their title id number, birthdate, first name, last name, sex, and hire date.
-- emp_no acts as the primary key, and emp_title_id is a foreign key from the titles table.
CREATE TABLE employees(
emp_no INT NOT NULL PRIMARY KEY,
emp_title_id VARCHAR (5) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
birth_date DATE NOT NULL,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
sex VARCHAR (1) NOT NULL,
hire_date DATE NOT NULL);

--Check first 10 values of employees table
select * from employees
LIMIT 10;

--Create a table for employees by department, including employee's number and their department number. 
--emp_no and dept_no are foreign keys from the employees and departments tables. 
--Create a composite key of emp_no and dept_no to act as primary key for the table. 
CREATE TABLE dept_emp (
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),	
dept_no VARCHAR(5) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no,dept_no));

--Check first 10 values of dept_emp
select * from dept_emp
LIMIT 10;

--Create a table of the department managers including the department number and the manager's employee number. 
--emp_no and dept_no are foreign keys from the employees and departments tables. 
--Create a composite key of emp_no and dept_no to act as primary key for the table. 
CREATE TABLE dept_manager (
dept_no VARCHAR(5) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (dept_no,emp_no));

--Check dept_manager
select * from dept_manager;

--Create a table for each employee's salary, including employee's numbers and their salaries. 
--emp_no is a foreign key from the employee's table and also acts as the primary key for the table. 
CREATE TABLE salaries (
emp_no INT NOT NULL PRIMARY KEY,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
salary INT NOT NULL);

--Check first 10 values of salaries
select * from salaries
LIMIT 10;


