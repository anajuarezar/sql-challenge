-------------------------------------DATA ANALYSIS-------------------------------------------------------

-- Once you have a complete database, do the following:
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

-- In order to find each element we need to make a join on the emp_no of both tables.
-- When we have our join, we just need to select the details we need. 


SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
  JOIN salary AS s
  ON (e.emp_no = s.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- This select is a little bit more complicated because of the date.
-- Since we need all employees hired in 1986, we are goint to use EXTRACT and YEAR to get the year of each date.
-- Afterwards, we just need to specify the year we need. 

SELECT first_name, last_name, hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date,'MM/DD/YYYY')) = '1986';


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
-- To obtain the information of several tables, we need to make several joins.
-- We need to join the dept_manager to the employees table, then we join the table with dept_emp to get to departments.
-- Once we have all the tables join we select the info we need. 
-- This joins must be inner, so when get to the dept_manger table, we only select the employees in that table. 

SELECT dm.emp_no, dm.dept_no, d.dept_name, e.first_name, e.last_name
FROM dept_manager as dm
  JOIN employees as e
  ON dm.emp_no = e.emp_no
    JOIN dept_emp as de
	ON e.emp_no = de.emp_no
	JOIN departments as d
	on de.dept_no = d.dept_no;


    
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- This query is similar to the one before but we don't need the dept_manager table. 

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  JOIN dept_manager as dm
  ON e.emp_no = dm.emp_no
    JOIN departments as d
	on dm.dept_no = d.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- This is a simple select, the tricky part is in the filter. Since we need that BOTH those conditions are fullfilled,
-- we are going to use AND in the WHERE. The first condition is simple, last_name needs to be Hercules.
-- in the next one we need the wildcard %, this one will allow us to look for everything that STARTS with B.
-- It needs to be AFTER B, since we want B to be the first letter.


SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- This query needs JOIN again, but we also need to be careful with the order in which we do it. 
-- Finally, we just need to filter the join table using WHERE and the name of the department. 

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  JOIN dept_emp as de
  ON e.emp_no = de.emp_no
    FULL  JOIN departments as d
	on de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales';
	

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- This query is similar to the one before, but we need to include another department. However in the WHERE statement we must use OR
-- so the command includes both departments. 

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
  JOIN dept_emp as de
  ON e.emp_no = de.emp_no
    JOIN departments as d
	on de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- In this query we need to do several things:
-- First, in the SELECT argument, we must include COUNT so we count how many times a last name is repeated, we use AS to save it.
-- Then, that result must be GROUPED BY last name, so it can count the names that are repeated and show it by last name.
-- Finally, we must use ORDER BY to sort it, we also add DESC to specify the order. 

SELECT last_name, COUNT(last_name)  AS last_repeat
FROM employees
GROUP BY last_name
ORDER BY last_repeat DESC;




