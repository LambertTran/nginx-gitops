#!/usr/bin/env bash

echo "Start new process"
exec nginx -g 'daemon off;'
