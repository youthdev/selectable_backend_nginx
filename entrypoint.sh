#!/bin/sh

sed -i -E "s/^;?worker_processes .*/worker_processes ${NGX_WORKER_PROCESSES:-10};/" /usr/local/openresty/nginx/conf/nginx.conf

if [ ! -z "$QDB_MAX_BODY_SIZE" ]; then
	sed -i -E "s/^(\s*)client_max_body_size .*/\1client_max_body_size ${QDB_MAX_BODY_SIZE};/" /etc/nginx/conf.d/default.conf
	sed -i -E "s/^(\s*)client_body_buffer_size .*/\1client_body_buffer_size ${QDB_MAX_BODY_SIZE};/" /etc/nginx/conf.d/default.conf
fi

exec "$@"