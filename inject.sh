#!/bin/sh
# Usage: ./inject.sh app.html dataset.json >injected.html
sed -e '/const dataset = \[\];/ {' \
    -e '  s/\[\];//;' \
    -e '  p;' \
    -e '  s/^.*$/;/;' \
    -e '  h;' \
    -e "  r $2" \
    -e '  g;' \
    -e '  N;' \
    -e '}' \
    < $1
