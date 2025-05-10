-- Tworzenie tabeli
CREATE TABLE IF NOT EXISTS kafka_data_01 (
    id INTEGER,
    value TEXT
);

CREATE TABLE IF NOT EXISTS kafka_data_02 (
    id INTEGER,
    name VARCHAR(128),
    message VARCHAR(512),
    name_upper VARCHAR(128),
    msg_length INTEGER
);

CREATE TABLE IF NOT EXISTS kafka_data_04 (
    window_start TIMESTAMP,
    window_end TIMESTAMP,
    count BIGINT
);

CREATE TABLE IF NOT EXISTS kafka_data_05 (
    order_id INTEGER,
    user_id INTEGER,
    amount INTEGER,
    order_timestamp TIMESTAMP,
    user_name TEXT,
    user_timestamp TIMESTAMP
);
