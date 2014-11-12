###PHP (Apache) and Node.js

Base image for hosting PHP applications. Node.js included to help with web
tooling e.g. Grunt.

This image includes phpunit so that the unit tests can be run and xdebug options
have been added for debugging.

The following environment variables are available to configure xdebug:

```
PHP_XDEBUG_REMOTE_HOST=1
PHP_XDEBUG_REMOTE_HOST=192.168.0.2
```
