#!/bin/bash

## =====================================================================
##  check_ngx_lua
##  runs some sanity checks against an nginx binary to confirm that the
##  ngx_lua module is built in and is built with luajit support
##
##  usage:
##    check_ngx_lua.sh <path_to_nginx_binary>
## =====================================================================

NGINX_BIN=$1
if [ -z $NGINX_BIN ] || [ ! -f $NGINX_BIN ]; then
  echo "Usage: $0 <path_to_nginx_binary>"
  exit 1
fi

# deleted

exit 0

