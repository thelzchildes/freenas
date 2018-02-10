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
service plexmediaserver_plexpass stop && mv /usr/local/plexdata-plexpass/ /usr/local/plexdata-plexpass-bak/ && setenv ALLOW_UNSUPPORTED_SYSTEM yes && setenv BATCH yes && portsnap fetch update && cd /usr/ports/ports-mgmt/portmaster && make deinstall clean && make install clean && portmaster -Gaydf --no-confirm --update-if-newer && sysrc plexmediaserver_plexpass_enable=YES && service plexmediaserver_plexpass stop && mv /usr/local/plexdata-plexpass-bak/ /usr/local/plexdata-plexpass/ && service plexmediaserver_plexpass start
```
