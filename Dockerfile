FROM openresty/openresty:alpine

ADD default.conf /etc/nginx/conf.d/default.conf

RUN echo "error_log  logs/error.log notice;" >> /usr/local/openresty/nginx/conf/nginx.conf

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]