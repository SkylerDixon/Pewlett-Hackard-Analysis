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
		PRIMARY KEY (emp_no)
);

SELECT * FROM departments;
