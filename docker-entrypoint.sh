#!/bin/bash
set -e

PHP_XDEBUG_ENABLED=${PHP_XDEBUG_ENABLED-"0"}

if [ -w /etc/php5/mods-available/xdebug.ini ] ; then
    cat > /etc/php5/mods-available/xdebug.ini <<EOF
zend_extension=/usr/lib/php5/20100525/xdebug.so
xdebug.remote_enable=$PHP_XDEBUG_ENABLED
xdebug.remote_host=$PHP_XDEBUG_REMOTE_HOST
xdebug.remote_port=9000
xdebug.remote_handler=dbgp
xdebug.remote_mode=req
EOF
fi

chown -R "$APACHE_RUN_USER:$APACHE_RUN_GROUP" .

if [ -n "$NEWRELIC_LICENCE" ]; then
export NR_INSTALL_KEY=$NEWRELIC_LICENCE
newrelic-install install
fi;

exec "$@"
