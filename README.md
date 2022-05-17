# debezium-cdc-pipeline

This is a proof of concept project for doing data replication using [Debezium](https://debezium.io/). Debezium is an open source distributed platform for change data capture that is using transaction logs to record all row-level changes committed to each database table and uses Kafka to transmit changes to any given consumer/sink. This makes it possible to achieve data replication without any code and get all the benefits of using [Kafka](https://kafka.apache.org/) such as HA, scaling and high performance.

For this project the goal was to replicate data from a [Postgres](https://www.postgresql.org/) database to a [Elasticsearch](https://www.elastic.co/) index.

## Topology

<p align="center">
  <img src="https://user-images.githubusercontent.com/7569192/168841823-ff67d23a-e533-4fe9-871b-ef287841d2df.png" />
</p>

## Setup

### Prereq

- [docker](https://www.docker.com/)

### Run demo

1. Download the Kafka connector plugins needed using `make download-plugins` and make sure that `connector-plugins` folder gets populated.
2. Run `docker compose up` to start services.
3. Create table using your client of choice.

```sql
CREATE TABLE IF NOT EXISTS customers (
    id UUID,
    email varchar(255) UNIQUE NOT NULL,
    name varchar(255) NOT NULL,
    created_at timestamptz NOT NULL,
    PRIMARY KEY(id)
);
```

4. Check that connector plugins below was installed correctly using `curl -v localhost:8083/connector-plugins`.

```json
    {
        "class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
        "type": "sink",
        "version": "13.0.0"
    },
    {
        "class": "io.debezium.connector.postgresql.PostgresConnector",
        "type": "source",
        "version": "1.9.2.Final"
    },
```

5. Health of the Kafka cluster can be monitored using [kafka-ui](https://github.com/provectus/kafka-ui) on http://localhost:8080.
6. Start inserting and removing entities into the table and watch the changes being replicated in Elasticsearch index `postgres.public.customers`.
