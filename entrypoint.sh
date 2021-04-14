#!/bin/sh

sed -i -E "s/^;?worker_processes .*/worker_processes ${NGX_WORKER_PROCESSES:-10};/" /usr/local/openresty/nginx/conf/nginx.conf

if [ ! -z "$RESOLVER" ]; then
	sed -i -E "s/127.0.0.11/${RESOLVER};/" /etc/nginx/conf.d/default.conf
fi

exec "$@"