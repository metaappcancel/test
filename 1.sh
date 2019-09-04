#!/bin/bash
cd $1
git reset --hard 
echo "First arg: $1"

cd $1

bob="Already up-to-date."
echo $bob

echo $(git pull) > meta.txt
cat meta.txt
if [ "$(cat meta.txt)" == "$bob" ]
then
echo "up"
else

echo "not up"
echo "/usr/bin/docker restart napp"
cd /root/metafi/ && docker-compose up -d --force-recreate --build && docker-compose --compatibility up -d
fi
rm -rf meta.txt
