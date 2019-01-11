FROM php:5.6-fpm

LABEL maintainer="lcdev76"

ENV http_proxy=${HTTP_PROXY}
ENV https_proxy=${HTTPS_PROXY}

RUN apt-get update \
  && apt-get install -y zlib1g-dev libicu-dev g++ libxml2-dev vim curl git


RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable opcache
	
ADD ./conf /usr/local/etc/php/conf.d

RUN curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

WORKDIR /usr/share/nginx/html

CMD ["php-fpm"]
