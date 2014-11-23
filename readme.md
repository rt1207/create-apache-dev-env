##サブドメインの動的生成 shell

####Edit Name-Server
You need to edit DNS

```DNS -> * A ip_address```


####Generate .conf

for Apache 2.2

```
sh gen-conf.sh PROJECT_NAME PROJECT_DOMAIN
```

then, move to /etc/httpd/conf.d/ or else.

####Generate dev-user
This generates user-account with password & dev-directory under /var/www/vhosts
```
sh gen-user.sh PROJECT_NAME USER_NAME
```