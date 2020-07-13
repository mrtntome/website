#!/usr/bin/env sh

SCRIPT_PATH=$(dirname $(realpath -s $0))

printf "Building site\n"
docker run --rm -it -v "$SCRIPT_PATH"/../hugo:/src klakegg/hugo:0.73.0 && docker-compose --project-directory "$SCRIPT_PATH" up -d

printf "Opening site\n"
xdg-open http://localhost:1313

printf "Press [ENTER] to terminate\n"
while true
do
read -s -N 1 -t 1 key
if [[ $key == $'\x0a' ]];
then
docker-compose --project-directory "$SCRIPT_PATH" down && printf "Bye\n"
exit 0
fi
done

