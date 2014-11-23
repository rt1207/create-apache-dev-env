#!/bin/sh

echo '
<VirtualHost *:80>
DocumentRoot /var/www/vhosts/production/'$1'
ServerName '$1'.'$2'
ServerAlias www.'$1'.'$2'
<Directory "/var/www/vhosts/production/'$1'">
Allow from all
</Directory>

<VirtualHost *:80>
DocumentRoot /var/www/vhosts/staging/'$1'
ServerName staging.'$1'.'$2'
ServerAlias www.staging.'$1'.'$2'
<Directory "/var/www/vhosts/staging/'$1'">
AuthType Basic
AuthName "protected"
AuthUserFile /var/www/vhosts/.htpasswd
require valid-user
</Directory>
</VirtualHost>

<VirtualHost *:80>
ServerName dev.'$1'.'$2'
ServerAlias dev.'$1'.'$2' *.'$1'.'$2'
VirtualDocumentRoot /var/www/vhosts/dev/%2/'$1'
<Directory "/var/www/vhosts/dev/">
Require all denied
AuthType Basic
AuthName "protected"
AuthUserFile /var/www/vhosts/.htpasswd
require valid-user
</Directory>
</VirtualHost>
' > ./$1.conf
