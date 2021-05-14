FROM alpine:3.12
EXPOSE 5050
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openrc openssl supervisor && mkdir /run/nginx/;
RUN apk add mysql php7-fpm lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml \
php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
# -addext "subjectAltName=DNS:localhost" \
# -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
# -out /etc/ssl/certs/nginx-selfsigned.crt
WORKDIR /var/www
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
#COPY wp-config.php /var/www/localhost/htdocs/wordpress
COPY wp-config.php /var/www/wordpress
COPY default.conf /etc/nginx/conf.d
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]