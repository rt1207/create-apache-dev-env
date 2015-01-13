#!/bin/sh
#
# sh gen-user.sh USERNAME PROJECTNAME
#

if id -u $1 >/dev/null 2>&1; then
    echo "user exists"
else
    echo "create user"
	useradd $1 -G wheel
	echo password | passwd $1 --stdin
fi

echo "create directories"
mkdir -p /var/www/vhosts
chmod 755 -R /var/www/vhosts
mkdir -p /var/www/vhosts/production/$2
mkdir -p /var/www/vhosts/staging/$2
mkdir -p /var/www/vhosts/dev/$1/$2
chmod 777 -R /var/www/vhosts/dev
[ -f /var/www/vhosts/dev/$1/$2/index.html ] && echo 'index.html exists' || echo 'Hello World!' > /var/www/vhosts/dev/$1/$2/index.html
