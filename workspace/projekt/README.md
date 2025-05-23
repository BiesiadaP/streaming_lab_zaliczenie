# Projekt:
Zadanie 2
Walidacja i przetwarzanie danych IoT w architekturze z Apache Kafka
Cel zadania:
Zaprojektować i zaimplementować system do walidacji strumienia danych z urządzeń IoT przy użyciu
Apache Kafka.
Dane mają być filtrowane na podstawie schematu i zakresów, a następnie kierowane do:
• bazy PostgreSQL (jeśli poprawne),
• pliku logu oraz topicu error_info (jeśli błędne).

# Środowisko:
Apache Kafka (Kafka + Zookeeper)
PostgreSQL
Python (kafka-python, jsonschema, psycopg2)
Docker + Docker Compose (Należy wykorzystać plik docker-compose.yml przedstawiony
podczas labolatorium)
Dane wejściowe (JSON):
{
"device_id": "sensor-001",
"temperature": 22.5,
"humidity": 60,
"event_timestamp": 1714750800000
}

# Wymagania funkcjonalne:
1. Producent Kafka (Python):
• Symuluje urządzenia IoT, wysyłając dane do topicu raw_iot.
2. Walidator (Python):
• Konsumuje dane z raw_iot
• Waliduje dane względem schematu JSON + zakresów (temperature 0–50,
humidity 0–100)
• Poprawne dane publikuje do topicu iot_data
• Błędne dane:
• zapisuje bdne wiadomoci do pliku error_log
• wysyła komunikat o błędzie do topicu error_log
3. Procesor danych (Python):
• Konsumuje topic iot_data i zapisuje dane do PostgreSQL (iot_data)
• Konsumuje topic error_log i zapisuje komunikaty do PostgreSQL (error_log)

Struktura bazy danych:

Tabela: iot_data
device_id -> Varchar(256)
temperature -> Float
humidity -> Float
event_timestamp -> Timestamp

Tabela: error_log
• device_id -> Varchar(256)
• error_message -> Varchar(512)
• event_timestamp -> Timestamp

# Kroki zadania:
1. Zaprojektuj i uruchom kompletny system do walidacji i przetwarzania danych IoT przy użyciu
Apache Kafka (Docker).
2. Utwórz wymagane topici: raw_iot, iot_data, error_info.
3. Napisz producenta generującego losowe dane IoT (poprawne i błędne).
4. Zaimplementuj walidator danych z logowaniem błędów.
5. Zbuduj przetwornik danych zapisujący dane do PostgreSQL.
6. Udowodnij działanie systemu pokazując dane w bazie oraz pliku błędów.