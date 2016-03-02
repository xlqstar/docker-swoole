FROM php:5.6-cli

RUN mkdir -p /var/script

RUN apt-get update &&  pecl install swoole \
    && docker-php-ext-enable swoole \
    && docker-php-ext-install pcre

COPY service.php /var/script/

WORKDIR /var/script

CMD ["php", "-f","/var/script/service.php"]