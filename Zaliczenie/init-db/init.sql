CREATE TABLE IF NOT EXISTS error_log (
    id SERIAL PRIMARY KEY,
    device_id VARCHAR(256) NOT NULL,
    error_message VARCHAR(512) NOT NULL,
    event_timestamp DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS iot_data (
    id SERIAL PRIMARY KEY,
    device_id VARCHAR(256) NOT NULL,
    temperature FLOAT NOT NULL,
    humidity  FLOAT NOT NULL,
    event_timestamp DOUBLE PRECISION NOT NULL
);