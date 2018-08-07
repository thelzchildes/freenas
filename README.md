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

# Install Emby
```
sed -i '' -e 's-.*"pkg+http://pkg.*-  url: "pkg+http://pkg.freebsd.org/FreeBSD:11:amd64/latest/",-g' /usr/local/etc/pkg/repos/FreeBSD.conf && setenv ALLOW_UNSUPPORTED_SYSTEM yes && setenv BATCH yes && portsnap fetch && portsnap extract && pkg install mono libass fontconfig freetype2 fribidi gnutls iconv opus samba48 sqlite3 libtheora libva libvorbis webp libx264 libzvbi && pkg install emby-server
```
