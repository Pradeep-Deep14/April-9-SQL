DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, name, manager_id) VALUES
(1, 'John Doe', NULL),        -- John Doe is not a manager
(2, 'Jane Smith', 1),          -- Jane Smith's manager is John Doe
(3, 'Alice Johnson', 1),       -- Alice Johnson's manager is John Doe
(4, 'Bob Brown', 3),           -- Bob Brown's manager is Alice Johnson
(5, 'Emily White', NULL),      -- Emily White is not a manager
(6, 'Michael Lee', 3),         -- Michael Lee's manager is Alice Johnson
(7, 'David Clark', NULL),      -- David Clark is not a manager
(8, 'Sarah Davis', 2),         -- Sarah Davis's manager is Jane Smith
(9, 'Kevin Wilson', 2),        -- Kevin Wilson's manager is Jane Smith
(10, 'Laura Martinez', 4);     -- Laura Martinez's manager is Bob Brown


SELECT * FROM EMPLOYEES
--write a SQL query to retrieve all employees' 
--details along with their manager's names based on the manager ID


SELECT E.EMP_ID AS EMPLOYEE_ID,
       E.NAME AS EMPLOYEE_NAME,
	   E1.MANAGER_ID AS MANAGER_ID,
	   E1.NAME AS MANAGER_NAME
FROM EMPLOYEES AS E
CROSS JOIN EMPLOYEES E1 
WHERE E.EMP_ID=E1.MANAGER_ID


--TASK
--Write a SQL query to find the names of all employees who are also managers. 

SELECT distinct e.name
FROM employees e
JOIN employees m ON e.emp_id = m.manager_id
