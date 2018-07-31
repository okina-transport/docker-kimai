FROM php:5-apache
MAINTAINER Fabian Köster <mail@fabian-koester.com>

EXPOSE 80

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip \
 && rm -rf /var/lib/apt/lists/*

ARG KIMAI_VERSION=1.3.1

RUN curl -L -o kimai.zip https://github.com/kimai/kimai/releases/download/${KIMAI_VERSION}/kimai_${KIMAI_VERSION}.zip \
  && mkdir -p /var/www/html \
  && unzip kimai.zip -d /var/www/html/ \
  && chown -R www-data:www-data /var/www/html/ \
  && rm *.zip

RUN docker-php-ext-install mysqli
