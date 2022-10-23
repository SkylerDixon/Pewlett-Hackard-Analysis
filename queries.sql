-- Creating tables for PH-EmployeeDB

Create TABLE departments (
	dept_no VARCHAR (4) NOT NULL,
	dept_name VARCHAR (40) NOT NULL,
	Primary KEY (dept_no),
	UNIQUE (dept_name)
	
);

Create TABLE employees (
	emp_no int NOT NULL,
	birth_date date NOT NULL,
 	first_name VARCHAR NOT NULL,
	last_name VARCHAR  NOT NULL,
	gender VARCHAR  NOT NULL,
	hire_date date NOT NULL,
	Primary KEY (emp_no)
);

Create TABLE dept_manager(
dept_no VARCHAR (4) NOT NULL, 
		emp_no INT NOT NULL,
		from_date DATE NOT NULL,
		to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
		PRIMARY KEY (emp_no, dept_no)
); 

Create TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
		PRIMARY KEY (emp_no)
);

CREATE TABLE dept_employee (
	emp_no INT NOT NULL,  
	dept_no VARCHAR NOT NULL, 
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
		PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL, 
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
		PRIMARY KEY (emp_no, title, from_date ) 
);

SELECT * FROM departments;

--Determine Retirement Eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
--Born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
---Born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';
---Born in 1954
Select first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';
---Born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

---Retirement Eligibility using birthdate and hire date
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

---Number of employees retiring 
SELECT COUNT(first_name) 
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


---SELECT INTO
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
       