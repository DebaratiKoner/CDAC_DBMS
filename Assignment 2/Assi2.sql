USE scott_db;

-- Q1. List employees whose salary is between 1200 and 1600.
SELECT *
FROM emp
WHERE sal BETWEEN 1200 AND 1600;

-- Q2. List employees whose job title is not CLERK or SALESMAN.
SELECT *
FROM emp
WHERE job NOT IN ('CLERK', 'SALESMAN');

-- Q3. List employees whose name has D as the second letter.
SELECT *
FROM emp
WHERE ename LIKE '_D%';

-- Q4. Select department details where department number is not 10.
SELECT *
FROM dept
WHERE deptno <> 10;

-- Q5. Select employee name and department number for employees whose names start with J or S and who are not in departments 20 or 30.
SELECT ename, deptno
FROM emp
WHERE (ename LIKE 'J%' OR ename LIKE 'S%')
AND deptno NOT IN (20, 30);

-- Q6. Select departments having five characters in their name and ending with S.
SELECT *
FROM dept
WHERE dname LIKE '____S';

-- Q7. List departments located in DALLAS or BOSTON.
SELECT *
FROM dept
WHERE loc IN ('DALLAS', 'BOSTON');

-- Q8. List LOWSAL and HISAL from SALGRADE.
SELECT losal, hisal
FROM salgrade;

-- Q9. List grades where LOWSAL is between 1400 and 2500.
SELECT *
FROM salgrade
WHERE losal BETWEEN 1400 AND 2500;

-- Q10. List grades where HISAL is between 2000 and 5000.
SELECT *
FROM salgrade
WHERE hisal BETWEEN 2000 AND 5000;