#!/bin/sh
cd "$(dirname "$0")"

curl -v -H "Content-Type: application/json" -d @../connector-configs/postgres-connector.json http://localhost:8083/connectors
curl -v -H "Content-Type: application/json" -d @../connector-configs/elasticsearch-sink-connector.json http://localhost:8083/connectors