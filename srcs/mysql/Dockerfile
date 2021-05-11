FROM alpine:3.12

EXPOSE 3306
RUN apk update

RUN apk add mariadb-server openrc mysql-client

COPY wp_base.sql wp_base.sql
COPY phpma_base.sql phpma_base.sql
COPY db.sh .
RUN bash db.sh
RUN chmod +x db.sh

ENTRYPOINT sh db.sh
