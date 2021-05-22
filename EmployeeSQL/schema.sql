--------------Employee Database: A Mystery in Two Parts------------------------------

------------------------------PART 1-------------------------------------------------


-- Inspect the CSVs and sketch out an ERD of the tables.
-- Use the information you have to create a table schema for each of the six CSV files. 


-- We begin by creating the tables, declaring the datatypes and creating the keys. 
-- Once we have created the tables, defined the relations and established the keys, we export it to pgAmin.
-- Here we have the final result. 
-- During the exporting, the names of tables and varaibles were added "", so we must eliminate for the code to run. 

-- We begin with droping all tables and cascade. We do this in case there is a mistake with the schema and we need to do it again. 

DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salary CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- It's time to create our tables.
-- It is important that before we begin writing the commands, we need to establish the relations between the tables.
-- We need to  create them and import them accordingly.
-- The first one will be employee. 

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_no_id VARCHAR (255) NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	sex CHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	PRIMARY KEY (emp_no)
);

-- When we import the csv file to the employees table we made, we find a problem, the dates.
-- To solve it, we need to catalogue the var as VARCHAR and transform it afterwards into the format we want.
-- To do this we:

SELECT TO_DATE ('7/25/1953','MM/DD/YYYY');

SELECT TO_DATE(birth_date,'MM/DD/YYYY')
FROM employees;

SELECT EXTRACT(YEAR FROM TO_DATE(birth_date,'MM/DD/YYYY'))
FROM employees;

-- We do the same for hire_date

SELECT TO_DATE ('4/28/1990','MM/DD/YYYY');

SELECT TO_DATE(hire_date,'MM/DD/YYYY')
FROM employees;

SELECT EXTRACT(YEAR FROM TO_DATE(hire_date,'MM/DD/YYYY'))
FROM employees;

-- We continue with the salary table. Since it has a relation with the employees' table through emp_no.

CREATE TABLE salary (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	title_id VARCHAR (255) NOT NULL,
	title VARCHAR (255) NOT NULL,
	PRIMARY KEY (title_id)
--	FOREIGN KEY (title_id) REFERENCES employees(emp_title_no_id)
);

CREATE TABLE departments (
	dept_no VARCHAR (255) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (255) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (255) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager (
	dept_no VARCHAR (255) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

---- Importing
-- After we finished creating the tables, we must import the data to fill the tables.
-- We will use the csv files we saved in our DATA file.
-- Like with the creation of tables, we need a specific order to import the data. 
-- Our order was:
-- 1- Employees.
-- 2. Salary.
-- 3. Titles.
-- 4. Departments.
-- 5. Dept_manager.
-- 6. Dept_emp