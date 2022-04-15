FROM php:8.0-cli

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev libzip-dev \
&& docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install -j$(nproc) gd \
&& docker-php-ext-configure zip && docker-php-ext-install zip \
&& docker-php-ext-configure mysqli && docker-php-ext-install mysqli

WORKDIR /var/www/

COPY . data

CMD ["/bin/sh", "data/install.sh"]