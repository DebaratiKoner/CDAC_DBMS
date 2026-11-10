CREATE DATABASE IF NOT EXISTS rtu_db;
USE rtu_db;
USE rtu_db;

CREATE TABLE rtu (
    rtu_id VARCHAR(4) PRIMARY KEY,
    location VARCHAR(30) NOT NULL,
    ip_address VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO rtu VALUES
('R101', 'BENGALURU', '192.168.0.1'),
('R102', 'MUMBAI', '192.168.0.2'),
('R103', 'CHENNAI', '192.168.0.3'),
('R104', 'NEW DELHI', '192.168.0.4'),
('R105', 'KOLKATA', '192.168.0.5');

CREATE TABLE sensors (
    sensor_id VARCHAR(4) PRIMARY KEY,
    rtu_id VARCHAR(4) NOT NULL,
    status VARCHAR(10) NOT NULL,
    sensor_type VARCHAR(20) NOT NULL,
    req_val INT NOT NULL,
    curr_val INT,

    FOREIGN KEY (rtu_id) REFERENCES rtu(rtu_id),

    CHECK (status IN ('ENABLED', 'DISABLED')),

    CHECK (sensor_type IN (
        'PRESSURE',
        'TEMPERATURE',
        'BAROMETER',
        'ULTRASONIC'
    ))
);

INSERT INTO sensors VALUES
('S801', 'R101', 'ENABLED', 'PRESSURE', 34, 33),
('S802', 'R101', 'ENABLED', 'TEMPERATURE', 98, 90),
('S803', 'R101', 'DISABLED', 'TEMPERATURE', 96, NULL),
('S804', 'R102', 'ENABLED', 'PRESSURE', 30, 32),
('S805', 'R102', 'ENABLED', 'PRESSURE', 36, 32),
('S806', 'R102', 'DISABLED', 'TEMPERATURE', 108, NULL),
('S807', 'R102', 'ENABLED', 'BAROMETER', 750, 660),
('S808', 'R103', 'ENABLED', 'BAROMETER', 780, 690),
('S809', 'R103', 'ENABLED', 'ULTRASONIC', 510, 450),
('S810', 'R104', 'DISABLED', 'ULTRASONIC', 530, NULL),
('S811', 'R104', 'ENABLED', 'PRESSURE', 60, 50);

CREATE TABLE users (
    user_id VARCHAR(4) PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    `role` VARCHAR(20) NOT NULL,

    CHECK (`role` IN ('MONITOR', 'ADMINISTER'))
);

INSERT INTO users VALUES
('U501', 'PRAKASH', 'MONITOR'),
('U502', 'PARTHIV', 'ADMINISTER'),
('U503', 'SMITHA', 'ADMINISTER');

CREATE TABLE controller (
    user_id VARCHAR(4) NOT NULL,
    sensor_id VARCHAR(4) NOT NULL,

    PRIMARY KEY (user_id, sensor_id),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id)
);

INSERT INTO controller VALUES
('U501', 'S801'),
('U501', 'S804'),
('U501', 'S806'),
('U502', 'S802'),
('U502', 'S804'),
('U503', 'S805'),
('U503', 'S806'),
('U501', 'S809'),
('U502', 'S810'),
('U503', 'S811'),
('U501', 'S807'),
('U503', 'S808'),
('U502', 'S801'),
('U501', 'S808');