```
iocage fetch --plugins --name "syncthing" dhcp="on" vnet="on" allow_raw_sockets="1" boot="on" bpf=yes
```
```
iocage stop syncthing
```
```
mkdir -p /mnt/tank03/iocage/jails/syncthing/root/mnt/video/movies
mkdir -p /mnt/tank03/iocage/jails/syncthing/root/mnt/video/tvshows
```
```
iocage fstab -a syncthing "/mnt/tank02/video/tvshows  /mnt/video/tvshows  nullfs  rw  0  0"
iocage fstab -a syncthing "/mnt/tank02/video/movies  /mnt/video/movies  nullfs  rw  0  0"
```
```
iocage start syncthing
```
```
iocage console syncthing
```
```
pw groupadd -n merc -g 3000 && pw groupmod syncthing -m merc && service syncthing stop
```
```
iocage restart syncthing
```
