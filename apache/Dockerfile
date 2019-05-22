FROM httpd:2.4.33-alpine

ARG php

RUN apk update; \
    apk upgrade;
# Copy apache vhost file to proxy php requests to php-fpm container
COPY demo.apache.conf /usr/local/apache2/conf/demo.apache.conf
RUN echo "Include /usr/local/apache2/conf/demo.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf

RUN sed -i 's/php:9000/$php:9000/g' /usr/local/apache2/conf/httpd.conf
