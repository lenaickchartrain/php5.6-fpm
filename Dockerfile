FROM php:5.6-fpm

RUN apt-get update \
  && apt-get install -y zlib1g-dev libicu-dev g++ libxml2-dev vim


RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable opcache
	
ADD ./conf /usr/local/etc/php/conf.d

WORKDIR /usr/share/nginx/html

CMD ["php-fpm"]
