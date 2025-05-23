CREATE TABLE iot_data (
    device_id VARCHAR(256),
    temperature FLOAT,
    humidity FLOAT,
    event_timestamp TIMESTAMP
);

CREATE TABLE error_log (
    device_id VARCHAR(256),
    error_message VARCHAR(512),
    event_timestamp TIMESTAMP
);
