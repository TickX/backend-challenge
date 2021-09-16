FROM php:8-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install --no-install-recommends -y \
        g++ \
        wget \
        libicu-dev \
        libonig-dev \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev

RUN curl -s https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin \
        --filename=composer

RUN docker-php-ext-install mbstring zip json

RUN pecl config-set php_ini /etc/php.ini

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Fixes cURL error 35: error:1414D172:SSL routines:tls12_check_peer_sigalg:wrong signature type
# https://stackoverflow.com/questions/58342699/php-curl-curl-error-35-error1414d172ssl-routinestls12-check-peer-sigalgwr
RUN sed -i 's/CipherString = DEFAULT@SECLEVEL=2/CipherString= DEFAULT@SECLEVEL=1/' /etc/ssl/openssl.cnf
