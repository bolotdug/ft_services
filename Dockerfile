FROM alpine:3.12


RUN apk add wget
RUN apk add vim

RUN apk add nginx openssl

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost"


RUN mkdir -p /run/nginx/
COPY ./start.sh .
RUN chmod 755 start.sh
EXPOSE 80 443
#CMD ["./start.sh"]
ENTRYPOINT ["./start.sh"]