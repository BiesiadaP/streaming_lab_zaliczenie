CREATE TABLE IF NOT EXISTS sensor_data (
    id SERIAL PRIMARY KEY,
    sensor_id TEXT NOT NULL,
    temperature FLOAT NOT NULL,
    timestamp DOUBLE PRECISION NOT NULL
);
