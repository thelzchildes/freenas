```
https://www.cyberciti.biz/faq/how-to-create-freenas-jails-with-iocage/
https://fogelholk.io/using-iocage-on-freenas/
https://www.cyberciti.biz/faq/how-to-create-freenas-jails-with-iocage/
```
# Iocage Setup
### Activate Zpool
```
iocage activate {poolname}
```
### Fetch FreeBSD
```
iocage fetch
```
### List Iocage VMs
```
iocage list
```
### Automatically Start Jail
```
iocage set boot=on {jailname}
```
### List dataset mounts
```
iocage fstab --list {jailname}
```
### Remote dataset mounts
```
iocage fstab -r {jailname} {index number}
```
# Emby-Server
## Install
```
wget https://raw.githubusercontent.com/MediaBrowser/iocage-amd64/master/emby-server.json
```
```
iocage fetch -P --name emby-server.json dhcp="on" vnet="on" allow_raw_sockets="1" boot="on" bpf=yes
```
```
iocage console emby-server
```
```
service emby-server stop && pw groupmod emby -n emby -g 3000 && pw usermod emby -n emby -u 816 -g 3000 && chown -R emby:emby /var/db/emby-server/ && sysrc 'emby_server_user=emby' && exit
```
## Mount Storage
```
iocage fstab -a emby-server /mnt/tank02/video/movies
iocage fstab -a emby-server /mnt/tank02/video/tvshows
```
```
mkdir -p /mnt/iocage/jails/emby-server/root/mnt/tank02/video/movies
mkdir -p /mnt/iocage/jails/emby-server/root/mnt/tank02/video/tvshows
```
```
iocage console emby-server
```
```
service emby-server start
```
## Port Forwarding
Setup port forwarding for port 8096
