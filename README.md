## Magento2 Nginx
Containerized nginx for Magento 2. This container sits in front of your Magento 2 php-fpm container and serves content according to Magento 2 best practices. You are able to pass downstream containers with real ip headers, so that the client's real ip can be recorded in the logs and database.

### Useage
A docker-compose example is provided below, this configuration assumes that you are running your nginx-backend behind a varnish cache and an nginx ssl termination proxy. Both downstream containers are named varnish and nginx respectively. You could call them whatever you like as long as you specify them in the downstream hosts.


docker-compose.yml:

```yaml
nginx-backend:
  image: magento2-nginx
  volumes:
    - ./volumes/magento:/var/www/html
    - ./volumes/log/nginx-backend:/var/log/nginx
  links:
    - magento2:magento2
  environment:
    DOWNSTREAM_HOSTS: varnish,nginx
    REAL_IP_HEADER: X-Real-IP # (default value)
```
You must call your magento php-fpm container, magento2 or link it to the container like so:
```
- <your_magento_container>:magento2
```

You can place this container behind your varnish cache or nginx proxy or both. To do this you should specify the following environmental variable:

DOWNSTREAM_HOSTS: host1,host2,...

This will ensure that the real upstream IP is passed to your magento 2 application from these hosts.
If your setup passes the real ip in a header other than "X-Real-IP", then you must specify this:

REAL_IP_HEADER: <your_real_ip_header>

NOTE: As per default please ensure that your php-fpm container is running on port 9000.

### Coming soon:
The ability to turn on and off the cacheing of static media files. Currently the container caches all media according to the magento 2 "nginx.sample.conf" file.

### Enjoy!
This container was made with love by someone at 3am.
