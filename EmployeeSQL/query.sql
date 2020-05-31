-- Data Analysis

-- Once you have a complete database, do the following:

-- List the following details of each employee: employee number, last name, first name, gender, and salary.

-->>>>>>>>>>>>>>>>>>>TABLE JOIN ANALYSIS
-- Employee and Salary Tables

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM "Employee" AS e
INNER JOIN "Salary" AS s 
ON e.emp_no=s.emp_no
ORDER BY e.emp_no ASC;

-- List employees who were hired in 1986.
-- Employee Table
SELECT * FROM "Employee" AS e
WHERE LEFT(e.hire_date,4)='1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-->>>>>>>>>>>>>>>>>>>TABLE JOIN ANALYSIS
-- Department DepartmentManager, Employee and Salary Tables

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, s.from_date, s.to_date 
FROM "DepartmentManager" AS dm
INNER JOIN "Department" AS d
ON dm.dept_no=d.dept_no
INNER JOIN "Employee" AS e
ON e.emp_no=dm.emp_no
INNER JOIN "Salary" AS s
ON s.emp_no=dm.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
-->>>>>>>>>>>>>>>>>>>TABLE JOIN ANALYSIS
-- Employee, DepartmentEmployee and Deparment Tables

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM "Employee" AS e
INNER JOIN "DepartmentEmployee" AS de
ON de.emp_no=e.emp_no
INNER JOIN "Department" AS d
ON de.dept_no=d.dept_no
ORDER BY e.emp_no ASC;

-- List all employees whose first name is "Hercules" and last names begin with "B."
-- Employee Tables
SELECT * FROM "Employee" AS e
WHERE e.first_name = 'Hercules' 
AND e.last_name LIKE 'B%'
ORDER BY e.emp_no ASC;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
-->>>>>>>>>>>>>>>>>>>TABLE JOIN ANALYSIS
-- Employee, DepartmentEmployee and Deparment Tables
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM "Employee" AS e
INNER JOIN "DepartmentEmployee" AS de
ON de.emp_no=e.emp_no
INNER JOIN "Department" AS d
ON d.dept_no=de.dept_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-->>>>>>>>>>>>>>>>>>>TABLE JOIN ANALYSIS
-- Employee, DepartmentEmployee and Deparment Tables
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM "Employee" AS e
INNER JOIN "DepartmentEmployee" AS de
ON de.emp_no=e.emp_no
INNER JOIN "Department" AS d
ON d.dept_no=de.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- Employee
SELECT e.last_name, COUNT(e.last_name) AS "common_last_name"
FROM "Employee" AS e
GROUP BY e.last_name
ORDER BY "common_last_name" DESC;








