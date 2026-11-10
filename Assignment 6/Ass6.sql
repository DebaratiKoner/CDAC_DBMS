USE rtu_db;

-- Part A 
-- Q1. Display username in uppercase, role with first letter capitalized and remaining letters lowercase, and length of username.
SELECT
    UPPER(user_name) AS username,
    CONCAT(
        UPPER(LEFT(role, 1)),
        LOWER(SUBSTRING(role, 2))
    ) AS formatted_role,
    LENGTH(user_name) AS username_length
FROM users;

-- Q2. Display percentage of difference between REQ_VAL and CURR_VAL as a whole number.
SELECT
    sensor_id,
    req_val,
    curr_val,
    ROUND(
        ABS(req_val - curr_val) * 100 / NULLIF(req_val, 0),
        0
    ) AS percentage_difference
FROM sensors;

-- Part B
-- Q1. List how many sensors are present of type PRESSURE.
SELECT COUNT(*) AS total_pressure_sensors
FROM sensors
WHERE sensor_type = 'PRESSURE';

-- Q2. Display number of sensors enabled and disabled. Sort by number of sensors.
SELECT
    status,
    COUNT(*) AS total_sensors
FROM sensors
GROUP BY status
ORDER BY total_sensors;

-- Q3. List how many sensors are present in each sensor type.
SELECT
    sensor_type,
    COUNT(*) AS total_sensors
FROM sensors
GROUP BY sensor_type;

-- Q4. List number of sensors under each RTU_ID.
SELECT
    rtu_id,
    COUNT(*) AS total_sensors
FROM sensors
GROUP BY rtu_id;

-- Q5. Display how many sensors are controlled by each user. Exclude users controlling less than 3 sensors and exclude user U503. Sort by user_id.
SELECT
    u.user_id,
    u.user_name,
    COUNT(c.sensor_id) AS total_sensors
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
WHERE u.user_id <> 'U503'
GROUP BY u.user_id, u.user_name
HAVING COUNT(c.sensor_id) >= 3
ORDER BY u.user_id;

