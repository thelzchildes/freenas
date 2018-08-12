```
https://www.cyberciti.biz/faq/how-to-create-freenas-jails-with-iocage/
```
```
https://fogelholk.io/using-iocage-on-freenas/
```

# Activate Zpool
```
iocage activate {poolname}
```

# Fetch FreeBSD
```
iocage fetch
```

# List Iocage VMs
```
iocage list
```

# Automatically Start Jail
```
iocage set boot=on {jailname}
```

# Install Emby-Server
```
wget https://raw.githubusercontent.com/MediaBrowser/iocage-amd64/master/emby-server.json
```
```
iocage fetch -P --name emby-server.json ip4_addr="em0|192.168.1.237/24"
```
```
iocage console emby-server
```
```
service emby-server stop && pw groupmod emby -n emby -g 3000 && pw usermod emby -n emby -u 3000 -g 3000 && chown -R emby:emby /var/db/emby-server/ && sysrc 'emby_server_user=emby' && exit
```
```
iocage fstab -a emby-server /mnt/tank02/video/movies
iocage fstab -a emby-server /mnt/tank02/video/tvshows
```
```
mkdir -p /mnt/iocage/jails/emby-server/root/mnt/tank02/video/movies
```
```
mkdir -p /mnt/iocage/jails/emby-server/root/mnt/tank02/video/tvshows
```
```
iocage console emby-server
```
```
service emby-server start
```
