## Magento2 Nginx
Containerized nginx for Magento 2. This can serve your php-fpm magento2 container.

### Useage
docker-compose example:

```yaml
nginx-backend:
  image: magento2-nginx
  volumes:
    - ./volumes/magento:/var/www/html
    - ./volumes/log/nginx-backend:/var/log/nginx
  links:
    - magento2:magento2
    - varnish:varnish
```
You must call your php-fpm container magento2 or link it to the container like so:
```
- your_magento_container_name:magento2
```

You can place this container behind your varnish cache but you must call your varnish container "varnish", or link it to the container like so:
```
- your_magento_varnish_name:varnish
```
This will ensure that the real upstream IP is passed to your magento 2 application.

### Enjoy!
This container was made with love by someone at 3am.
