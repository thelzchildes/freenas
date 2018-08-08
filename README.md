# Install rtorrent
```
sed -i '' -e 's-.*"pkg+http://pkg.*-  url: "pkg+http://pkg.freebsd.org/FreeBSD:11:amd64/latest/",-g' /usr/local/etc/pkg/repos/FreeBSD.conf && pkg install -y curl && cd /tmp && curl -LJO https://raw.githubusercontent.com/thelzchildes/freenas/master/install.sh && chmod +x install.sh && ./install.sh
```

# Install plex-pass
```
setenv ALLOW_UNSUPPORTED_SYSTEM yes && setenv BATCH yes && portsnap fetch && portsnap extract && cd /usr/ports/multimedia/plexmediaserver-plexpass/ && make install clean && sysrc plexmediaserver_plexpass_enable=YES
```

# Upgrade plex-pass
```
service plexmediaserver_plexpass stop 
```
```
cp /usr/local/plexdata-plexpass /usr/local/plexdata-plexpass-bak
```
```
portsnap fetch update && setenv ALLOW_UNSUPPORTED_SYSTEM yes && portmaster -aydG --no-confirm
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
iocage fstab -a emby-server /mnt/tank02/video
```
```
mkdir -p /mnt/iocage/jails/emby-server/root/mnt/video
```
```
service emby-server start
```
