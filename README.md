# DockerHeartbeat

When using in a `docker-compose.yml` file, use the following settings:

```
environment:
  - ADMIN_USER=sammcb
  - ADMIN_PASSWORD=testpass
volumes:
  - ./monitors:/etc/heartbeat/monitors.d
```

Also make sure heartbeat is connected to the [logstash, elasticsearch, kibana] network and to any other container networks that need to be monitored. Place any extra monitors in a `monitors` folder at the docker compose root directory.
