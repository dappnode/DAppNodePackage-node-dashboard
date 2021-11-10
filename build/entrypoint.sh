#!/bin/bash
set -e

cd /usr/share/nginx/html/_next/static/chunks/pages
app_js=$(basename _app-*)

sed -i 's/NEXT_PUBLIC_BLOCKNATIVE_DAPP_ID_REPLACE/'"${NEXT_PUBLIC_BLOCKNATIVE_DAPP_ID}"'/' $app_js
sed -i 's@NEXT_PUBLIC_NODE_URL_REPLACE@'"${NEXT_PUBLIC_NODE_URL}"'@' $app_js
sed -i 's@NEXT_PUBLIC_XDAI_NODE_URL_REPLACE@'"${NEXT_PUBLIC_XDAI_NODE_URL}"'@' $app_js

exec nginx -g 'daemon off;'