# Ćwiczenie 5:
- Odczyt dwóch niezależnych strumieni danych z Kafka (orders-topic i users-topic)
- Parsowanie danych JSON z obu strumieni
- Łączenie (join) po wspólnym polu user_id
- Wykorzystanie okien czasowych i watermark, by obsłużyć dane przychodzące z opóźnieniem

Start Docker containers (Win): docker compose -f .\spark-docker-compose.yml up -d  
Stop Docker containers (Win): docker compose -f .\spark-docker-compose.yml down -v
