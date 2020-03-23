#!/bin/bash

echo "start consul-template"
consul-template -template "/index.tpl:/usr/share/nginx/html/index.html" \
                -consul-addr "consul:8500" \
                -exec "nginx -g 'daemon off;'"
