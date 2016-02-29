# Debian: PHP 7.0 - FPM

# Pull the base image.
FROM debian:jessie

# Set environment variables.
ENV PHP_VERSION 7.0

# Install PHP.
RUN apt-get update && apt-get install -y wget; \

    echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list; \
    wget https://www.dotdeb.org/dotdeb.gpg; \
    apt-key add dotdeb.gpg; \

    apt-get update && apt-get install -y \
    php${PHP_VERSION}-apcu \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-opcache; \

    apt-get purge -y wget; \

    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add /bin.
ADD run.sh /bin/run.sh

# Expose ports.
EXPOSE 9000

# Configure executable.
ENTRYPOINT ["sh", "/bin/run.sh"]

# Define default command.
CMD []
