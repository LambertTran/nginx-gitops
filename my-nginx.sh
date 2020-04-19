#!/bin/bash

start() {
    echo "Start nginx"
    nginx -g 'daemon off;'
}

reload() {
    echo 'Reload nginx'
    nginx reload
}
nginx(){
    ps aux | grep nginx
    if [ $? == 0 ]; then
        reload
    else
        start
    fi
}

echo "start consul-template"
consul-template -consul-addr "consul-ui:8500" \
                -template "/index.tpl:/usr/share/nginx/html/index.html" \
                -exec "wrapper.sh"
