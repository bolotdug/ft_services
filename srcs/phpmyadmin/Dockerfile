FROM alpine:3.12
EXPOSE 5000
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openssl supervisor && mkdir /run/nginx/;
RUN apk add php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml \
		php7-fpm php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
		php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN openssl req -x509 -nodes -days 10 -subj "/C=RU/ST=Tatarstan/O=School 21/CN=localhost" \
-addext "subjectAltName=DNS:localhost" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt
RUN mkdir -p /usr/share/webapps
RUN cd /var/www
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && \
		tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz -C /var/www/ && \
		mv var/www/phpMyAdmin-5.1.0-all-languages var/www/phpmyadmin && \
		rm -f phpMyAdmin-5.1.0-all-languages.tar.gz

COPY default.conf /etc/nginx/conf.d
COPY config.inc.php var/www/phpmyadmin
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]