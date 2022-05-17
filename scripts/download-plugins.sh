#!/bin/sh
cd "$(dirname "$0")"

curl --show-error --location https://d1i4a15mxbxib1.cloudfront.net/api/plugins/confluentinc/kafka-connect-elasticsearch/versions/13.0.0/confluentinc-kafka-connect-elasticsearch-13.0.0.zip | tar -xf - -C ../connector-plugins
curl --show-error --location https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/1.9.2.Final/debezium-connector-postgres-1.9.2.Final-plugin.tar.gz | tar -xf - -C ../connector-plugins

