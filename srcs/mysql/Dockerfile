FROM alpine:3.12

EXPOSE 3306
RUN apk update

RUN apk add openrc mysql mysql-client

COPY wordpress.sql wordpress.sql
# COPY phpmyadmin.sql phpmyadmin.sql
COPY mydb.cnf /etc/mysql/my.cnf
COPY db.sh .
RUN chmod +x db.sh

ENTRYPOINT sh db.sh
