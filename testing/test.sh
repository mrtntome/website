#!/usr/bin/env sh

docker run --rm -it -v $(pwd)/..:/src klakegg/hugo:0.73.0 && docker-compose up -d
