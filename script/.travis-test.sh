#!/bin/bash
set -e

# Setup shortcuts.
ROOT=`pwd`
NGINX=$ROOT/nginx/objs/nginx
SERVER=http://localhost:8080/

# Start server.
$NGINX -c $ROOT/script/test.conf

# Download long file with rate limit; ~5 sec.
curl -s -H 'Accept-encoding: br' -o ./war-and-peace.br --limit-rate 300 $SERVER/war-and-peace.txt

# Stop server.
$NGINX -c $ROOT/script/test.conf -s stop

# Restore status-quo.
cd $ROOT
