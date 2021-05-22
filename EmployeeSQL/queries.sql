-------------------------------------DATA ANALYSIS-------------------------------------------------------

-- Once you have a complete database, do the following:
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- In order to find each element we need to make a view which will include all of the details:


SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
  JOIN salary AS s
  ON (e.emp_no = s.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date,'MM/DD/YYYY')) = '1986';


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT dm.emp_no, dm.dept_no, d.dept_name, e.first_name, e.last_name
FROM dept_manager as dm
  INNER JOIN employees as e
  ON dm.emp_no = e.emp_no
    INNER JOIN dept_emp as de
	ON e.emp_no = de.emp_no
	INNER JOIN departments as d
	on de.dept_no = d.dept_no;


    
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  JOIN dept_manager as dm
  ON e.emp_no = dm.emp_no
    JOIN departments as d
	on dm.dept_no = d.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  JOIN dept_emp as de
  ON e.emp_no = de.emp_no
    FULL  JOIN departments as d
	on de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales';
	

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  JOIN dept_manager as dm
  ON e.emp_no = dm.emp_no
    JOIN departments as d
	on dm.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';



-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)  AS last_repeat
FROM employees
GROUP BY last_name
ORDER BY last_repeat DESC;




