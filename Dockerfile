FROM debian:buster-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	gnupg2 \
	wget \
	ca-certificates

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list
ENV HB_HOME=/usr/share/heartbeat HB_CONF=/etc/heartbeat
RUN apt-get update && apt-get install -y --no-install-recommends \
	heartbeat-elastic

RUN apt-get purge -y gnupg2 wget ca-certificates && apt-get autoremove -y

COPY ./heartbeat.yml ${HB_CONF}/heartbeat.yml
RUN chmod go-w ${HB_CONF}/heartbeat.yml

COPY ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 5066

CMD /usr/local/bin/start.sh
