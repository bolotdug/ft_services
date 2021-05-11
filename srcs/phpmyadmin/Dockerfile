FROM alpine:3.12
EXPOSE 5000
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx openssl && mkdir /run/nginx/;
RUN apk add php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml \
		php7-fpm php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
		php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN mkdir -p /usr/share/webapps
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && \
		tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz -C /usr/share/webapps && \
		mv usr/share/webapps/phpMyAdmin-5.1.0-all-languages usr/share/webapps/phpmyadmin && \
		rm -f phpMyAdmin-5.1.0-all-languages.tar.gz

COPY default.conf /etc/nginx/conf.d
COPY config.inc.php usr/share/webapps/phpmyadmin
COPY start.sh .
ENTRYPOINT sh start.sh