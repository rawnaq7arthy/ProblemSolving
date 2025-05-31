CREATE DATABASE JOINTABLES;
USE JOINTABLES;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', NULL);

-- INNER JOIN Only matching rows from both tables.
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- LEFT JOIN All employees, even those without departments.
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- RIGHT JOIN All departments, even those without employees.
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- FULL JOIN (UNION) All employees and all departments, with NULLs where there's no match.
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id

UNION

SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- CROSS JOIN Every employee with every department.
SELECT e.name, d.department_name
FROM employees e
CROSS JOIN departments d;









