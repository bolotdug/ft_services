FROM alpine:3.12
EXPOSE 8086
RUN apk update && apk add supervisor influxdb libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.18.2_linux_i386.tar.gz \
	&& tar -zxvf telegraf-1.18.2_linux_i386.tar.gz -C /tmp \
	&& mv /tmp/telegraf-1.18.2 /tmp/telegraf \
	&& rm -rf telegraf-1.18.2_linux_i386.tar.gz
COPY supervisord.conf supervisord.conf

RUN mkdir -p /etc/telegraf \
&& tmp/telegraf/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf
COPY start.sh start.sh
RUN chmod 777 start.sh
CMD sh start.sh
