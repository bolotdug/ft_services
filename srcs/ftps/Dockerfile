FROM alpine:3.12
EXPOSE 21 31000 31001 31002

RUN apk update && apk add openssl vsftpd
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/ssl.key \
-out /etc/ssl/ssl.crt

COPY vsftpd.conf /etc/vsftpd/
COPY ftpsetup.sh .
RUN chmod +x ftpsetup.sh
CMD sh ftpsetup.sh