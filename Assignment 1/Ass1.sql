-- SET 1 Q1 — Select all rows and columns of all the tables.
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

-- SET 1 Q2 — Employees with new salary 500 more than original.
SELECT empno, ename, sal, sal + 500 AS new_salary
FROM emp;

-- SET 1 Q3 — empno, name and annual salary.
SELECT empno, ename, sal * 12 AS annual_salary
FROM emp;

-- SET 1 Q4 — empno, name and annual salary where salary hiked by 500.
SELECT empno, ename, (sal + 500) * 12 AS annual_salary
FROM emp;

-- SET 1 Q5 — Annual salary = (sal + comm); alias "AnnualSal".
SELECT ename, (sal + IFNULL(comm, 0)) * 12 AS AnnualSal
FROM emp;

-- SET 1 Q6 — Name, sal, comm, hiredate for salary < 1200.
SELECT ename, sal, comm, hiredate
FROM emp
WHERE sal < 1200;

-- SET 1 Q7 — Employee and Job title in format "Employee1 works as jobtitle1."
SELECT CONCAT(ename, ' works as ', job, '.') AS employee_info
FROM emp;

-- SET 2 Q1 — Different job types without duplication.
SELECT DISTINCT job FROM emp;

-- SET 2 Q2 — Employees in dept 10 and 30 in alphabetical order of names.
SELECT ename, deptno
FROM emp
WHERE deptno IN (10, 30)
ORDER BY ename;

-- SET 2 Q3 — Clerks in department 20.
SELECT * FROM emp
WHERE job = 'CLERK' AND deptno = 20;

-- SET 2 Q4 — Employees having 'LL' or 'TH' in their names.
SELECT ename FROM emp
WHERE ename LIKE '%LL%' OR ename LIKE '%TH%';

-- SET 2 Q5 — Employees who do not have a manager.
SELECT * FROM emp WHERE mgr IS NULL;

-- SET 2 Q6 — Employees hired in year 81.
SELECT * FROM emp
WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';

-- SET 2 Q7 — First name and join date of employees who are Manager or SalesMan.
SELECT ename, hiredate FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');

-- SET 2 Q8 — Details of jobs in descending order of the title.
SELECT DISTINCT job FROM emp
ORDER BY job DESC;

-- SET 2 Q9 — Salesmen with salary > commission; sort salary desc, name asc.
SELECT * FROM emp
WHERE job = 'SALESMAN' AND sal > comm
ORDER BY sal DESC, ename ASC;

-- SET 2 Q10 — Output 'SMITH works since 17-DEC-80 as CLERK' using concatenation.
SELECT CONCAT(ename, ' works since ', DATE_FORMAT(hiredate, '%d-%b-%y'), ' as ', job) AS info
FROM emp;

-- SET 2 Q11 — All clerks earning less than 1000 and all managers.
SELECT * FROM emp
WHERE (job = 'CLERK' AND sal < 1000) OR job = 'MANAGER';

-- SET 2 Q12 — Employees with annual remuneration > 30000 (commission included).
SELECT * FROM emp
WHERE (sal + IFNULL(comm, 0)) * 12 > 30000;

-- SET 2 Q13 — Name, job, mgr, hire date, empno (empno first); alias STARTDATE for HIREDATE.
SELECT empno, ename, job, mgr, hiredate AS startdate
FROM emp;