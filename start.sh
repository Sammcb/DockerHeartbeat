while true; do
	heartbeat setup -e -E output.logstash.enabled=false -E output.elasticsearch.enabled=true && break
	sleep 5
done
heartbeat -e
