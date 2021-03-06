#!/bin/sh

export WEB_CONCURRENCY=1

wget -O public/packages.min.json https://storage.googleapis.com/cdnjs-assets/package.min.js

if [ x"$APP" = x"mainSite" ]; then
    node --expose-gc webServer.js
elif [ x"$APP" = x"api" ]; then
    node --expose-gc apiServer.js
else
    echo "Please provide valid \$APP variable: api or mainSite" 1>&2
    exit 1
fi
