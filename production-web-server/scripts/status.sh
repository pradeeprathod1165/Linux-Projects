#!/bin/bash

echo "========================="
echo " WEB SERVER STATUS"
echo "========================="
echo

echo "NGINX STATUS"
echo "------------"

systemctl is-active nginx

echo
echo "PORT CHECK"
echo "----------"

ss -tulpn | grep ':80'

echo
echo "WEBSITE TEST"
echo "------------"

curl -I localhost 2>/dev/null | head -1
