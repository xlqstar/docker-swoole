FROM php:5.6-cli

RUN mkdir -p /var/script

RUN apt-get update && apt-get install libpcre3 libpcre3-dev openssl libssl-dev \
    && pecl install swoole \
    && docker-php-ext-enable swoole \

COPY service.php /var/script/

WORKDIR /var/script

CMD ["php", "-f","/var/script/service.php"]