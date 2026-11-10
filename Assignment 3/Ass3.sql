USE scott_db;

SELECT * FROM emp;

-- Q1. List all aggregates on salary columns for each department, excluding department 10.
SELECT
    deptno,
    COUNT(*) AS total_employees,
    SUM(sal) AS total_salary,
    AVG(sal) AS average_salary,
    MIN(sal) AS minimum_salary,
    MAX(sal) AS maximum_salary
FROM emp
WHERE deptno <> 10
GROUP BY deptno;

-- Q2. List departments where the number of employees is more than 4.
SELECT
    deptno,
    COUNT(*) AS total_employees
FROM emp
GROUP BY deptno
HAVING COUNT(*) > 4;

-- Q3. Display jobs with average salary greater than 2000. Order by average salary.
SELECT
    job,
    AVG(sal) AS average_salary
FROM emp
GROUP BY job
HAVING AVG(sal) > 2000
ORDER BY average_salary;

-- Q4. List how many employees are under each manager.
SELECT
    mgr,
    COUNT(*) AS total_employees
FROM emp
WHERE mgr IS NOT NULL
GROUP BY mgr
ORDER BY mgr;

-- Q5. Display manager number and salary of the lowest-paid employee under that manager.
SELECT
    mgr,
    MIN(sal) AS lowest_salary
FROM emp
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) > 800
ORDER BY lowest_salary DESC;