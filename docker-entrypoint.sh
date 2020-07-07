#!/bin/sh
set -e

if [ ! -f "/etc/overture/config.json" ];then
  cp /config/config.json /etc/overture/config.json
fi

if [ ! -f "/etc/overture/china_domain.txt" ];then
  cp /config/china_domain.txt /etc/overture/china_domain.txt
fi

if [ ! -f "/etc/overture/china_ip_list.txt" ];then
  cp /config/china_ip_list.txt /etc/overture/china_ip_list.txt
fi

if [ ! -f "/etc/overture/gfwlist_domain.txt" ];then
  cp /config/gfwlist_domain.txt /etc/overture/gfwlist_domain.txt
fi

if [ ! -f "/etc/overture/ip_network_alternative.txt" ];then
  cp /config/ip_network_alternative.txt /etc/overture/ip_network_alternative.txt
fi

if [ ! -f "/etc/overture/hosts_overture.txt" ];then
  cp /config/hosts_overture.txt /etc/overture/hosts_overture.txt
fi

if [ ! -f "/etc/overture/domain_ttl.txt" ];then
  cp /config/domain_ttl.txt /etc/overture/domain_ttl.txt
fi

if [ "${1#-}" != "$1" ];then
  set -- overture "$@"
fi

exec "$@"
