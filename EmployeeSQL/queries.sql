-------------------------------------DATA ANALYSIS-------------------------------------------------------

-- Once you have a complete database, do the following:
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- In order to find each element we need to make a view which will include all of the details:


SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
  JOIN salary AS s
  ON (e.emp_no = s.emp_no);
  
CREATE VIEW employee_details AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
  JOIN salary AS s
  ON (e.emp_no = s.emp_no);
  
SELECT *
FROM employee_details;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.





