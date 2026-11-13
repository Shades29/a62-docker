FROM php:7.4-apache

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/bullseye-updates/d' /etc/apt/sources.list && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y nano git && \
    rm -rf /var/lib/apt/lists/*

RUN echo 'HOLA SOY Hugo' > /var/www/html/index.html && \
    echo '<?php phpinfo(); ?>' > /var/www/html/info.php