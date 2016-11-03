FROM tommylau/php-5.2

RUN apt-get update -y && apt-get install -y libmemcached-dev zlib1g-dev libzip-dev \
    && sh -c 'printf "\n" | pecl install memcache' \
    && sh -c 'pecl install zip' \
    && sh -c 'printf "\n\n\n\n\n\n" | pecl install apc' \
    && sh -c 'echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini' \
    && sh -c 'echo "extension=zip.so" > /usr/local/etc/php/conf.d/zip.ini' \
    && sh -c 'echo "extension=apc.so" > /usr/local/etc/php/conf.d/apc.ini' \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
