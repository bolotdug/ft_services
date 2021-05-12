FROM alpine:3.12
EXPOSE 21

RUN apk update && apk add openssl vsftpd
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

COPY vsftpd.conf /etc/vsftpd/
COPY setup.sh .
RUN chmod +x setup.chmod
CMD sh setup.sh