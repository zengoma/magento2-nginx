FROM nginx

COPY nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY nginx/magento2/nginx.conf.sample /etc/nginx/magento2/

WORKDIR  /var/www/html
VOLUME /var/www/html
