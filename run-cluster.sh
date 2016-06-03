#!/bin/bash
docker run -t  -p 8080 -p 4040 -p 7077 -e SPARK_MODE=master "$1"
docker run -t -p 8081 -p 4040 -p 7077 -p 22222 -e SPARK_MASTER_IP="$2" "$1"
docker run -t -p 8081 -p 4040 -p 7077 -p 22222 -e SPARK_MASTER_IP="$2" "$1"
