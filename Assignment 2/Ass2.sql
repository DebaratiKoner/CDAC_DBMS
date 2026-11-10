USE rtu_db;

SELECT * FROM rtu;
SELECT * FROM sensors;
SELECT * FROM users;
SELECT * FROM controller;

-- Q1. Fetch details of all sensors which are disabled.
SELECT *
FROM sensors
WHERE status = 'DISABLED';

-- Q2. List sensors where required value is less than current value.
SELECT *
FROM sensors
WHERE req_val < curr_val;

-- Q3. List TEMPERATURE sensors having required value greater than 96. Sort by required value.
SELECT *
FROM sensors
WHERE sensor_type = 'TEMPERATURE'
AND req_val > 96
ORDER BY req_val;

-- Q4. List sensors which have no current values.
SELECT *
FROM sensors
WHERE curr_val IS NULL;

-- Q5. List sensors of type TEMPERATURE and PRESSURE.
SELECT *
FROM sensors
WHERE sensor_type IN ('TEMPERATURE', 'PRESSURE');

-- Q6. List sensors with RTU ID 102, sensor type PRESSURE, and required value greater than 30.
SELECT *
FROM sensors
WHERE rtu_id = 'R102'
AND sensor_type = 'PRESSURE'
AND req_val > 30;