#!/bin/sh

if id -u $1 >/dev/null 2>&1; then
        echo "user exists"
else
        echo "user does not exist"
	sudo useradd $2 -G wheel
	echo password | passwd $2 --stdin
fi

mkdir -p /var/www/vhosts/production/$1
mkdir -p /var/www/vhosts/staging/$1
mkdir -p /var/www/vhosts/dev/$2/$1
[ -f /var/www/vhosts/dev/$2/$1/index.html ] && echo 'index.html exists' || echo 'Hello World!' > /var/www/vhosts/dev/$2/$1/index.html
