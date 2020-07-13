#!/usr/bin/env sh

echo "Building site"
docker run --rm -it -v $(pwd)/..:/src klakegg/hugo:0.73.0 && docker-compose up -d

echo "Opening site"
xdg-open http://localhost:1313

echo "Press [ENTER] to terminate"
while true
do
read -s -N 1 -t 1 key
if [[ $key == $'\x0a' ]];
then
docker-compose down && printf "Bye"
exit 0
fi
done

