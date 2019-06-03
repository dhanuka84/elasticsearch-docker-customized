#!/bin/sh
docker run --name es-t1 --publish-all \
	--network es-net \
	--rm \
	--cap-add=IPC_LOCK --ulimit nofile=65536:65536 --ulimit memlock=-1:-1 \
	-e cluster.name=docker-cluster -e bootstrap.memory_lock=true -e "discovery.zen.ping.unicast.hosts=es-t0" \
	-v /home/dhanuka/projects/docker/esconfig/jvm.options:/usr/share/elasticsearch/config/jvm.options \
	-v /home/dhanuka/projects/docker/esdata2:/usr/share/elasticsearch/data \
	-v /home/dhanuka/projects/docker/eslog1:/usr/share/elasticsearch/logs \
	docker.elastic.co/elasticsearch/elasticsearch:6.3.2 
