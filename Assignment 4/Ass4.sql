USE scott_db;

-- Q1. List DEPTNO, DNAME along with total salary in each department.
SELECT
    d.deptno,
    d.dname,
    SUM(e.sal) AS total_salary
FROM dept d
INNER JOIN emp e
ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname;

-- Q2. List details from EMP, DEPT and SALGRADE, excluding clerks and employees with grade 1. Order by names.
SELECT
    e.*,
    d.dname,
    d.loc,
    s.grade
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno
INNER JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.job <> 'CLERK'
AND s.grade <> 1
ORDER BY e.ename;

-- Q3. List employees with grade 3 or 4.
SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    s.grade
FROM emp e
INNER JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE s.grade IN (3, 4);

-- Q4. List employees located in DALLAS.
SELECT
    e.*,
    d.dname,
    d.loc
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno
WHERE d.loc = 'DALLAS';

-- Q5. List employee and department details for departments 30 and 40.
SELECT
    e.*,
    d.dname,
    d.loc
FROM emp e
INNER JOIN dept d
ON e.deptno = d.deptno
WHERE d.deptno IN (30, 40);

-- Q6. List employees earning less than their managers. Display their managers' details also.
SELECT
    e.ename AS employee_name,
    e.sal AS employee_salary,
    m.ename AS manager_name,
    m.sal AS manager_salary
FROM emp e
INNER JOIN emp m
ON e.mgr = m.empno
WHERE e.sal < m.sal;

-- Q7. Find all employees who joined the company before their manager.
SELECT
    e.ename AS employee_name,
    e.hiredate AS employee_hiredate,
    m.ename AS manager_name,
    m.hiredate AS manager_hiredate
FROM emp e
INNER JOIN emp m
ON e.mgr = m.empno
WHERE e.hiredate < m.hiredate;

USE rtu_db;

-- Q1. Display RTU details along with sensor details for all RTUs.
SELECT
    r.*,
    s.*
FROM rtu r
LEFT JOIN sensors s
ON r.rtu_id = s.rtu_id;

-- Q2. Display user details and sensor details controlled by each user.
SELECT
    u.*,
    s.*
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
INNER JOIN sensors s
ON c.sensor_id = s.sensor_id;


-- Q3. Display user details and sensor details controlled by each user along with RTU details.
SELECT
    u.*,
    s.*,
    r.*
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
INNER JOIN sensors s
ON c.sensor_id = s.sensor_id
INNER JOIN rtu r
ON s.rtu_id = r.rtu_id;

-- Q4. List how many sensors are controlled by each user. Display username and count. Sort by count.
SELECT
    u.user_name,
    COUNT(c.sensor_id) AS total_sensors
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_sensors;

-- Q5. Display user details who are controlling TEMPERATURE sensors.
SELECT DISTINCT
    u.*
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
INNER JOIN sensors s
ON c.sensor_id = s.sensor_id
WHERE s.sensor_type = 'TEMPERATURE';

-- Q6. Display user details controlling sensor S801 along with sensor details and location.
SELECT
    u.*,
    s.*,
    r.location
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
INNER JOIN sensors s
ON c.sensor_id = s.sensor_id
INNER JOIN rtu r
ON s.rtu_id = r.rtu_id
WHERE s.sensor_id = 'S801';

