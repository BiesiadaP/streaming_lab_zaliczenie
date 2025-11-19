Project: IoT Data Validation and Processing in an Apache Kafka Architecture

This project entails designing and implementing a robust system for validating and processing streaming IoT data using Apache Kafka as the central message broker, following an event-driven architecture. The core objective is to filter data based on defined schemas and ranges, directing valid records to a PostgreSQL database and handling invalid data separately for logging and auditing.

⚙️ Environment and Components

The entire system is deployed using Docker and Docker Compose for containerization and orchestration.

    Messaging Layer: Apache Kafka (with Zookeeper) serves as the central data bus and message queuing system.

    Data Stores: PostgreSQL is used as the target database for storing validated, clean IoT data and persistent error logs.

    Processing Logic: Python is the language used for implementing the applications (Producer, Validator, and Data Processor), leveraging key libraries: kafka-python for messaging, jsonschema for data validation, and psycopg2 for PostgreSQL connectivity.

🗃️ Kafka Topic and Database Structure

Kafka Topics

Three Kafka topics are required to facilitate the pipeline's branching logic:

    raw_iot: The landing topic for all initial, raw data sent by the IoT Producer.

    iot_data: Stores the validated and clean IoT records, ready for persistence.

    error_info: Receives structured error messages for logging and auditing purposes.

PostgreSQL Database Schema

The PostgreSQL database contains two tables:

Table: iot_data (Stores valid sensor readings)

    device_id: VARCHAR(256)

    temperature: FLOAT

    humidity: FLOAT

    event_timestamp: TIMESTAMP

Table: error_log (Stores metadata about invalid records)

    device_id: VARCHAR(256)

    error_message: VARCHAR(512) (Provides a detailed reason for the validation failure)

    event_timestamp: TIMESTAMP

🔍 Functional Requirements and Data Flow

The system is defined by three main Python components that interact via Kafka, forming a sequential processing flow.

1. IoT Producer (Python)

    Role: Simulates various IoT devices.

    Action: Generates random data in the specified JSON format, intentionally including both valid and invalid (out-of-range or malformed) records.

        Input Data Example:
        JSON

        {
        "device_id": "sensor-001",
        "temperature": 22.5,
        "humidity": 60,
        "event_timestamp": 1714750800000
        }

    Output: Publishes all generated data to the raw_iot topic.

2. Data Validator (Python)

    Role: Acts as a consumer of raw data and a producer for processed/error data.

    Action: Consumes messages from raw_iot.

    Validation Logic: Checks the incoming data against two primary criteria:

        JSON Schema Check: Ensures all required fields (device_id, temperature, humidity, event_timestamp) are present and adhere to the correct data types.

        Range Checks:

            temperature: Must be strictly between 0 and 50.

            humidity: Must be strictly between 0 and 100.

    Output Routing (Branching):

        Valid Data: Publishes the clean record to the iot_data topic.

        Invalid Data:

            Writes the error details and the faulty message to a local error_log file.

            Sends a structured error message (including device_id, timestamp, and the reason for failure) to the error_info topic.

3. Data Processor (Python)

    Role: Acts as the final data sink, persisting all processed and audited data to PostgreSQL.

    Action (Dual Consumption):

        Consumes iot_data: Writes the validated IoT records into the iot_data table in PostgreSQL.

        Consumes error_info: Writes the structured error messages into the error_log table in PostgreSQL.

📝 Project Implementation Steps

    Infrastructure Setup: Use Docker Compose to launch the necessary services: Kafka, Zookeeper, and PostgreSQL.

    Topic Creation: Ensure the three mandatory Kafka topics (raw_iot, iot_data, error_info) are properly created.

    Producer Development: Implement the Python Producer to simulate IoT data, ensuring a mix of valid and invalid records.

    Validator Implementation: Write the Python Validator code incorporating the jsonschema and range validation logic, and managing the dual output streams for valid and error data.

    Processor Implementation: Develop the Python Processor to handle the two distinct consumption streams and perform database inserts into the PostgreSQL tables using psycopg2.

    System Verification: Prove the end-to-end functionality by:

        Querying the PostgreSQL tables (iot_data should contain only clean, valid data; error_log should contain detailed error messages).

        Confirming the contents of the local file system's error_log file.
