--------------Employee Database: A Mystery in Two Parts------------------------------

------------------------------PART 1-------------------------------------------------


-- Inspect the CSVs and sketch out an ERD of the tables.
-- Use the information you have to create a table schema for each of the six CSV files. 


-- We begin by creating the tables, declaring the datatypes and creating the keys. 
-- Once we have created the tables, defined the relations and established the keys, we export it to pgAmin.
-- Here we have the final result. 
-- During the exporting, the names of tables and varaibles were added "", so we must eliminate for the code to run. 

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_no_id VARCHAR (255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	sex CHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salary (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	title_id VARCHAR (255) NOT NULL,
	title VARCHAR (255) NOT NULL,
	PRIMARY KEY (emp_no)
	FOREIGN KEY (title_id) REFERENCES employees(emp_title_no_id)
);

CREATE TABLE departments (
	dept_no VARCHAR (255) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (255) NOT NULL
);

CREATE TABLE dept_emp (
	dept_no VARCHAR (255) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (255) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

