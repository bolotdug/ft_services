# FROM alpine:3.12


# RUN apk add wget
# RUN apk add vim

# RUN apk add nginx openssl

# RUN mkdir -p /run/nginx/
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#  -out /etc/ssl/certs/nginx-selfsigned.crt \
#  -keyout /etc/ssl/private/nginx-selfsigned.key \
#  -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21/OU=School/CN=localhost"

# COPY ./start.sh .
# RUN chmod 755 start.sh
# EXPOSE 80 443
# #CMD ["./start.sh"]
# ENTRYPOINT sh start.sh

FROM alpine:3.12
EXPOSE 80 443
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openssl && mkdir /run/nginx/;
RUN echo "<h1>Nginx page.</h1>" > /var/www/localhost/htdocs/index.html;
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt
COPY default.conf /etc/nginx/conf.d
COPY ./nginx/start.sh .
ENTRYPOINT sh start.sh