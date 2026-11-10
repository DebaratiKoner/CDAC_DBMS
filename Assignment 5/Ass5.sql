USE rtu_db;

-- Part A
-- Q1. Fetch details of all sensors which are disabled.
SELECT *
FROM sensors
WHERE status = 'DISABLED';

-- Q2. List sensors having required value less than current value.
SELECT *
FROM sensors
WHERE req_val < curr_val;

-- Q3. List TEMPERATURE sensors with required value greater than 96. Sort by required value.
SELECT *
FROM sensors
WHERE sensor_type = 'TEMPERATURE'
AND req_val > 96
ORDER BY req_val;

-- Q4. List sensors which have no current values.
SELECT *
FROM sensors
WHERE curr_val IS NULL;

-- Q5. List all sensors of type TEMPERATURE and PRESSURE.
SELECT *
FROM sensors
WHERE sensor_type IN ('TEMPERATURE', 'PRESSURE');

-- Q6. List sensors with RTU ID 102, sensor type PRESSURE and required value greater than 30.
SELECT *
FROM sensors
WHERE rtu_id = 'R102'
AND sensor_type = 'PRESSURE'
AND req_val > 30;

-- Part B 
-- Q1. Display username in uppercase, role with first letter capitalized and remaining letters lowercase, and username length.
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

-- Part C 
-- Q1. List how many sensors are present of type PRESSURE.
SELECT COUNT(*) AS total_pressure_sensors
FROM sensors
WHERE sensor_type = 'PRESSURE';

-- Q2. Display number of sensors enabled and disabled. Sort by number of sensors.
SELECT status, COUNT(*) AS total_sensors
FROM sensors
GROUP BY status
ORDER BY total_sensors;

-- Q3. List how many sensors are present in each sensor type.
SELECT sensor_type, COUNT(*) AS total_sensors
FROM sensors
GROUP BY sensor_type;

-- Q4. List number of sensors under each RTU_ID.
SELECT rtu_id, COUNT(*) AS total_sensors
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

-- Part D 
-- Q1. Display RTU details along with sensor details for all RTUs.
SELECT r.*, s.*
FROM rtu r
LEFT JOIN sensors s
ON r.rtu_id = s.rtu_id;

-- Q2. Display user details and sensor details controlled by each user.
SELECT u.*, s.*
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
INNER JOIN sensors s
ON c.sensor_id = s.sensor_id;

-- Q3. Display user details, sensor details and RTU details.
SELECT u.*, s.*, r.*
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

-- Q5. Display user details who are controlling sensors of type TEMPERATURE.
SELECT DISTINCT u.*
FROM users u
INNER JOIN controller c
ON u.user_id = c.user_id
INNER JOIN sensors s
ON c.sensor_id = s.sensor_id
WHERE s.sensor_type = 'TEMPERATURE';

-- Q6. Display user details controlling sensor S801, along with sensor details and location.
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

-- Part E 
-- Q1. Display sensor details located in CHENNAI.
SELECT *
FROM sensors
WHERE rtu_id = (
    SELECT rtu_id
    FROM rtu
    WHERE location = 'CHENNAI'
);

-- Q2. Display user details controlling sensors in MUMBAI location.
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    WHERE sensor_id IN (
        SELECT sensor_id
        FROM sensors
        WHERE rtu_id = (
            SELECT rtu_id
            FROM rtu
            WHERE location = 'MUMBAI'
        )
    )
);

-- Q3. Display sensor details controlled by SMITHA.
SELECT *
FROM sensors
WHERE sensor_id IN (
    SELECT sensor_id
    FROM controller
    WHERE user_id = (
        SELECT user_id
        FROM users
        WHERE user_name = 'SMITHA'
    )
);

-- Q4. Display user details controlling sensors with ID between S803 and S808.
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    WHERE sensor_id BETWEEN 'S803' AND 'S808'
);

-- Q5. Display user details controlling the most number of sensors.
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    GROUP BY user_id
    HAVING COUNT(sensor_id) = (
        SELECT MAX(total_sensors)
        FROM (
            SELECT COUNT(sensor_id) AS total_sensors
            FROM controller
            GROUP BY user_id
        ) AS temp
    )
);

-- Q6. Display RTU details which have the most number of sensors.
SELECT *
FROM rtu
WHERE rtu_id IN (
    SELECT rtu_id
    FROM sensors
    GROUP BY rtu_id
    HAVING COUNT(sensor_id) = (
        SELECT MAX(total_sensors)
        FROM (
            SELECT COUNT(sensor_id) AS total_sensors
            FROM sensors
            GROUP BY rtu_id
        ) AS temp
    )
);

