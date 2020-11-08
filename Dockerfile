FROM php:7.4-cli

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    libpq-dev \
    libonig-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    postgresql \
    git \
    ssh \
    vim

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    mysqli \
    pdo \
    pgsql \
    pdo_mysql \
    pdo_pgsql \
    mbstring \
    tokenizer \
    intl \
    xml \
    ctype \
    json \
    zip \
    gd

COPY --from=composer:2.0.4 /usr/bin/composer /usr/bin/composer