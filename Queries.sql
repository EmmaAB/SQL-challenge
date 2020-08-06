--List each employee (Employee Number, Last Name, First Name, Sex, Salary)
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;

--List employees who were hired in 1986 (Last Name, First Name, Hire Date)
SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date < '1987-01-01'
AND hire_date > '1985-12-31';

-- List department managers (Departnement number, Dept. name, Employee number, Last Name, First Name)
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager as m
INNER JOIN departments as d ON
m.dept_no = d.dept_no
INNER JOIN employees as e ON
m.emp_no = e.emp_no;

-- List employees by department (Employee Number, Last Name, First Name, Department Name)
SELECT x.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as x ON
x.emp_no = e.emp_no
INNER JOIN departments as d ON
x.dept_no= d.dept_no;

-- List Employees "Hercules B." (Last Name, First Name, Sex)
SELECT e.last_name, e.first_name, e.sex
FROM employees as e
WHERE e.last_name LIKE 'B%'
AND e.first_name = 'Hercules';

-- List Sales Dept. Employees (Employee Number, Last Name, First Name, Department Name)
SELECT x.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as x ON
x.emp_no = e.emp_no
INNER JOIN departments as d ON
x.dept_no= d.dept_no
WHERE d.dept_name='Sales';

-- List Sales and Development Dept. Employees (Employee Number, Last Name, First Name, Department Name)
SELECT x.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as x ON
x.emp_no = e.emp_no
INNER JOIN departments as d ON
x.dept_no= d.dept_no
WHERE d.dept_name IN ('Sales','Development');

-- List frequency of last names in descending order
SELECT e.last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees as e
GROUP BY e.last_name
ORDER BY "Last Name Frequency" DESC;

-- Epilogue: Search my ID number
SELECT * FROM employees
WHERE emp_no = '499942';


