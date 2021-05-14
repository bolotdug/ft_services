FROM alpine:3.12
EXPOSE 3000
RUN apk update && apk add influxdb libc6-compat
RUN mkdir -p /usr/graf/ \
	&& wget https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz \
	&& tar -zxvf grafana-7.5.5.linux-amd64.tar.gz -C /usr/graf \
	&& mv /usr/graf/grafana-7.5.5 /usr/graf/grafana \
	&& rm -rf grafana-7.5.5.linux-amd64.tar.gz

COPY grafana.db /usr/graf/grafana/data/grafana.db
WORKDIR /usr/graf/grafana/bin
CMD ["./grafana-server"]