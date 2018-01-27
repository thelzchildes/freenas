# Install rtorrent
```
cd /tmp && curl -LJO https://raw.githubusercontent.com/thelzchildes/freenas/master/install.sh && chmod +x install.sh && ./install.sh
```

# Install plex-pass
```
setenv ALLOW_UNSUPPORTED_SYSTEM yes && setenv BATCH yes && portsnap fetch && portsnap extract && cd /usr/ports/multimedia/plexmediaserver-plexpass/ && make install clean && sysrc plexmediaserver_plexpass_enable=YES
```

# Upgrade plex-pass
```
setenv ALLOW_UNSUPPORTED_SYSTEM yes && setenv BATCH yes && cd /usr/ports/ports-mgmt/portmaster && make reinstall clean && portmaster -af
```
