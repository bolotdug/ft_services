FROM alpine:3.12
EXPOSE 80 443
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openssl && mkdir /run/nginx/;
RUN apk add php-fpm php-mysql
RUN apk add php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN echo "<h1>Nginx page for phpmyadmin.</h1>" > /var/www/localhost/htdocs/index.html;
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt
COPY default.conf /etc/nginx/conf.d
COPY start.sh .
ENTRYPOINT sh start.sh