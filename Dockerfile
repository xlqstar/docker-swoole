FROM php:5.6-cli

RUN mkdir -p /var/script

RUN apt-get update &&  pecl install swoole \
    && docker-php-ext-enable swoole

COPY service.php /var/script/

WORKDIR /var/script

CMD ["php", "-f","/var/script/service.php"]