#!/bin/sh

service php$PHP_VERSION-fpm start && tail -F /var/log/php$PHP_VERSION-fpm.log
