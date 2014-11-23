#!/bin/sh

if id -u $1 >/dev/null 2>&1; then
    echo "user exists"
else
    echo "create user"
	useradd $2 -G wheel
	echo password | passwd $2 --stdin
fi

echo "create directories"
mkdir /var/www/vhosts
chmod 755 -R /var/www/vhosts
mkdir -p /var/www/vhosts/production/$1
mkdir -p /var/www/vhosts/staging/$1
mkdir -p /var/www/vhosts/dev/$2/$1
[ -f /var/www/vhosts/dev/$2/$1/index.html ] && echo 'index.html exists' || echo 'Hello World!' > /var/www/vhosts/dev/$2/$1/index.html
