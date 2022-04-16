FROM php:8.0-cli

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev libzip-dev \
    libmcrypt. \
&& docker-php-ext-configure gd --with-freetype --with-jpeg \
&& docker-php-ext-install -j$(nproc) gd \
&& docker-php-ext-configure zip && docker-php-ext-install zip \
&& docker-php-ext-configure mysqli && docker-php-ext-install mysqli

RUN curl -fsSL 'https://pecl.php.net/get/mcrypt-1.0.4.tgz' -o mcrypt.tar.gz \
    && mkdir -p mcrypt \
    && tar -xf mcrypt.tar.gz -C mcrypt --strip-components=1 \
    && rm mcrypt.tar.gz \
    && ( \
        cd mcrypt \
        && phpize \
        && ./configure \
        && make -j "$(nproc)" \
        && make install \
    ) \
    && rm -r mcrypt \
    && docker-php-ext-enable mcrypt

WORKDIR /var/www/

COPY . data

CMD ["/bin/sh", "data/install.sh"]
