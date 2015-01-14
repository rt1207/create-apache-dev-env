#!/bin/sh
#
# sh gen-user.sh USERNAME PROJECTNAME
#

# Add User if there isn't
if id -u $1 >/dev/null 2>&1; then
    echo "user exists"
else
    echo "create user"
	useradd $1 -G wheel
	echo password | passwd $1 --stdin
fi

# Create for ssh-login
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys

# Create Directories: capistrano
echo "create directories"
mkdir -p /var/www/vhosts
mkdir -p /var/www/vhosts/production/current
mkdir -p /var/www/vhosts/staging/current
mkdir -p /var/www/vhosts/dev/$1/$2
chmod 777 -R /var/www/vhosts/
[ -f /var/www/vhosts/dev/$1/$2/index.html ] && echo 'index.html exists' || echo 'Hello World!' > /var/www/vhosts/dev/$1/$2/index.html
