docker run --name sc-master --memory=3g -d  -e SPARK_MODE=master sparkcassandra:latest
docker run --name sc-worker-1 --memory=3g -d -e CASSANDRA_SEEDS=172.17.0.2 -e SPARK_MASTER_IP=172.17.0.2 sparkcassandra:latest
docker run --name sc-worker-2 --memory=3g  -d -e CASSANDRA_SEEDS=172.17.0.2 -e SPARK_MASTER_IP=172.17.0.2 sparkcassandra:latest
