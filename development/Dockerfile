# Debian: PHP 7.0 - Development Environment
#
# - Composer
# - Curl
# - Git
# - Nano
# - PHP 7.0 (CLI, FPM, Xdebug ..)
# - PHPUnit
# - Vim
# - Wget

# Pull the base image.
FROM debian:jessie

# Set UID.
USER root

# Set environment variables.
ENV APP_DIR         /srv/www/webapp
ENV BUILD_DIR       ${APP_DIR}/build
ENV BUILDXML        /config/build.xml
ENV COMPOSER_HOME   $HOME/.composer
ENV GITHUB_TOKEN    4d4a63415908c89118216dd2e5254fa4101796ba
ENV HOME            /home/root
ENV PATH            vendor/bin:$COMPOSER_HOME/vendor/bin:$PATH
ENV PHP_VERSION     7.0
ENV PHPUNIT_VERSION 5.0.*

# Install utilities.
RUN apt-get update && apt-get install -y curl git nano wget

# Install PHP.
RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list; \
    wget https://www.dotdeb.org/dotdeb.gpg; \
    apt-key add dotdeb.gpg; \
    apt-get update && apt-get install -y \
    php${PHP_VERSION}-apcu \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-xdebug

# Disable Xdebug CLI extension.
RUN sed -i "s/zend_extension=xdebug.so/;zend_extension=xdebug.so/" /etc/php/${PHP_VERSION}/cli/conf.d/20-xdebug.ini

# Install Composer.
RUN mkdir -p $COMPOSER_HOME/vendor/bin; \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=$COMPOSER_HOME/vendor/bin --filename=composer; \
    composer --version; \
    composer config --global github-oauth.github.com $GITHUB_TOKEN

# Install PHPUnit.
RUN composer self-update; \
    composer global require "phpunit/phpunit=${PHPUNIT_VERSION}"; \
    composer global update

# Clean APT.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add /bin.
ADD run.sh /bin/run.sh

# Expose ports.
EXPOSE 9000

# Configure executable.
ENTRYPOINT ["sh", "/bin/run.sh"]

# Define default command.
CMD []
