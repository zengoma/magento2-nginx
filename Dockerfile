FROM nginx

COPY nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY nginx/magento2/nginx.conf.sample /etc/nginx/magento2/

ENV REAL_IP_HEADER X-Real-IP;

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

WORKDIR  /var/www/html
VOLUME /var/www/html

CMD ["nginx", "-g", "daemon off;"]
