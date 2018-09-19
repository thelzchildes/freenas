```
iocage fetch --plugins --name "syncthing" dhcp="on" vnet="on" allow_raw_sockets="1" boot="on" bpf=yes
```
```
iocage stop syncthing
```
```
mkdir -p /mnt/tank03/iocage/jails/syncthing/root/mnt/tank02/video
```
```
iocage fstab -a syncthing /mnt/tank02/video
```
```
iocage fstab -e syncthing
```
Change ro to rw
```
iocage start syncthing
```
```
iocage console syncthing
```
```
pw groupadd -n merc -g 3000 && pw useradd -n merc -u 816 -G merc,www -d /nonexistent -s /usr/sbin/nologin && service syncthing stop
```
```
chown -R merc:merc /usr/local/etc/syncthing && chown -R merc:merc /var/tmp/syncthing && chown -R merc:merc /var/log/syncthing.log && chown -R merc:merc /var/run/syncthing.pid && chown -R merc:merc /var/mail/syncthing
```
```
sysrc 'SYNCTHING_user=merc' && service syncthing start
```
```
exit
```
```
iocage restart syncthing
```
