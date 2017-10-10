#!/usr/bin/env bash
set -euo pipefail

if ! [ -z ${DOWNSTREAM_HOSTS+x} ]; then

  IFS=', ' read -r -a array <<< "${DOWNSTREAM_HOSTS}"
  echo '# Downstream hosts (real-ip)' >> /etc/nginx/conf.d/realip.conf;

  for element in "${array[@]}"
  do
      echo "set_real_ip_from $element" >> /etc/nginx/conf.d/realip.conf;
  done

  echo "real_ip_header ${REAL_IP_HEADER}" >> /etc/nginx/conf.d/realip.conf;

fi

exec "$@"
