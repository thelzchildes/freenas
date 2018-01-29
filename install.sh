#!/bin/sh

read -p "Create default directories?" jailstor
jailstor=${jailstor:-no}

read -p "Port Offset (01-99)?" portoffset
portoffset=${portoffset:-00}

echo -n Setting up default rtorrent user...
pw addgroup merc > /tmp/rtorrent_install.log
pw groupmod merc -g 3000 >> /tmp/rtorrent_install.log
echo "merc" | pw useradd -n merc -u 816 -s /bin/tcsh -m -G merc,www,media -d /home/merc
echo done

echo -n Setting install variables...
export BATCH="yes" >> /tmp/rtorrent_install.log
cat <<EOF >> /etc/make.conf
ALLOW_UNSUPPORTED_SYSTEM=yes
EOF
cat <<EOF >> /etc/make.conf
WITH_PKGNG=yes
EOF
echo done

#echo Fetching Ports...
#portsnap fetch >> /tmp/rtorrent_install.log

#echo -n Extracing Ports...
#portsnap extract >> /tmp/rtorrent_install.log
#echo done

echo -n Updating Package...
pkg update >> /tmp/rtorrent_install.log 2>> /tmp/rtorrent_install_error.log
echo done

echo -n Upgrading Packages...
pkg upgrade -y /tmp/rtorrent_install.log 2>> /tmp/rtorrent_install_error.log
echo done

# echo -n Installing Portamaster...
# pkg install -y portmaster
# pkg2ng
# portmaster -aydbg --no-confirm
# echo done

echo -n Installing Git...
pkg install -y -f git >> /tmp/rtorrent_install.log
echo done

echo -n Installing Screen...
pkg install -y -f screen >> /tmp/rtorrent_install.log
echo done

echo -n Installing Lighttpd...
pkg install -y -f lighttpd >> /tmp/rtorrent_install.log
echo done

echo -n Installing Nano...
pkg install -y -f nano >> /tmp/rtorrent_install.log
echo done

echo -n Installing rTorrent...
pkg install -y -f rtorrent >> /tmp/rtorrent_install.log
echo done

echo -n Installing php56...
pkg install -y -f php56 >> /tmp/rtorrent_install.log
echo done

echo -n Installing php56-extensions...
pkg install -y -f php56-extensions >> /tmp/rtorrent_install.log
pkg install -y -f php56-bz2 >> /tmp/rtorrent_install.log
pkg install -y -f php56-ctype >> /tmp/rtorrent_install.log
pkg install -y -f php56-curl >> /tmp/rtorrent_install.log
pkg install -y -f php56-fileinfo >> /tmp/rtorrent_install.log
pkg install -y -f php56-filter >> /tmp/rtorrent_install.log
pkg install -y -f php56-gd >> /tmp/rtorrent_install.log
pkg install -y -f php56-hash >> /tmp/rtorrent_install.log
pkg install -y -f php56-iconv >> /tmp/rtorrent_install.log
pkg install -y -f php56-json >> /tmp/rtorrent_install.log
pkg install -y -f php56-mbstring >> /tmp/rtorrent_install.log
pkg install -y -f php56-mcrypt >> /tmp/rtorrent_install.log
pkg install -y -f php56-mysql >> /tmp/rtorrent_install.log
pkg install -y -f php56-mysqli >> /tmp/rtorrent_install.log
pkg install -y -f php56-openssl >> /tmp/rtorrent_install.log
pkg install -y -f php56-pdo >> /tmp/rtorrent_install.log
pkg install -y -f php56-pdo_sqlite >> /tmp/rtorrent_install.log
pkg install -y -f php56-posix >> /tmp/rtorrent_install.log
pkg install -y -f php56-session >> /tmp/rtorrent_install.log
pkg install -y -f php56-simplexml >> /tmp/rtorrent_install.log
pkg install -y -f php56-sockets >> /tmp/rtorrent_install.log
pkg install -y -f php56-sqlite3 >> /tmp/rtorrent_install.log
pkg install -y -f php56-tokenizer >> /tmp/rtorrent_install.log
pkg install -y -f php56-xml >> /tmp/rtorrent_install.log
pkg install -y -f php56-xmlreader >> /tmp/rtorrent_install.log
pkg install -y -f php56-xmlrpc >> /tmp/rtorrent_install.log
pkg install -y -f php56-xmlwriter >> /tmp/rtorrent_install.log
pkg install -y -f php56-zip >> /tmp/rtorrent_install.log
echo done

echo -n Install ruTorrent plugin dependencies...
pkg install -y -f mediainfo >> /tmp/rtorrent_install.log
pkg install -y -f sox >> /tmp/rtorrent_install.log
pkg install -y -f unrar >> /tmp/rtorrent_install.log
pkg install -y -f ffmpeg >> /tmp/rtorrent_install.log
echo done

echo -n Installing php.ini...
cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini >> /tmp/rtorrent_install.log
echo done

echo -n Installing rTorrent...
mkdir -p /usr/local/www >> /tmp/rtorrent_install.log
cd /usr/local/www >> /tmp/rtorrent_install.log
git clone https://github.com/Novik/ruTorrent.git >> /tmp/rtorrent_install.log 2> /tmp/rtorrent_install_error.log
mv ruTorrent/ rutorrent >> /tmp/rtorrent_install.log
chown -R merc:www /usr/local/www/rutorrent >> /tmp/rtorrent_install.log
chmod -R 777 /usr/local/www/rutorrent >> /tmp/rtorrent_install.log
echo done

echo -n Installing .rtorrent.rc...
cp /usr/local/share/examples/rtorrent/rtorrent.rc /home/merc/.rtorrent.rc >> /tmp/rtorrent_install.log
cp /usr/local/share/examples/rtorrent/rtorrent.rc ~/.rtorrent.rc >> /tmp/rtorrent_install.log
chown merc:merc /home/merc/.rtorrent.rc >> /tmp/rtorrent_install.log
chown merc:merc /home/merc/.rtorrent.rc >> /tmp/rtorrent_install.log
echo done

if [ "${jailstor}" = 'yes' ]; then
  echo -n Setting Up Folders...
  mkdir -p /media/appdata/rtorrent1/.session >> /tmp/rtorrent_install.log
  mkdir -p /media/downloads/watch >> /tmp/rtorrent_install.log
  mkdir -p "/media/downloads/watch/TV Shows"
  mkdir -p /media/downloads/watch/Movies
  mkdir -p /media/downloads/watch/Games
  mkdir -p /media/downloads/watch/Books
  mkdir -p /media/downloads/watch/Manual
  mkdir -p /media/downloads/watch/Applications
  mkdir -p /media/downloads/watch/Music
  mkdir -p /media/downloads/complete >> /tmp/rtorrent_install.log
  mkdir -p "/media/downloads/complete/TV Shows"
  mkdir -p /media/downloads/complete/Movies
  mkdir -p /media/downloads/complete/Games
  mkdir -p /media/downloads/complete/Books
  mkdir -p /media/downloads/complete/Manual
  mkdir -p /media/downloads/complete/Applications
  mkdir -p /media/downloads/complete/Music
  mkdir -p /media/downloads/incoming >> /tmp/rtorrent_install.log
  mkdir -p "/media/downloads/incoming/TV Shows"
  mkdir -p /media/downloads/incoming/Movies
  mkdir -p /media/downloads/incoming/Games
  mkdir -p /media/downloads/incoming/Books
  mkdir -p /media/downloads/incoming/Manual
  mkdir -p /media/downloads/incoming/Applications
  mkdir -p /media/downloads/incoming/Music
  mkdir -p /media/downloads/watch/TV Shows
  chown -R merc:merc /media/appdata >> /tmp/rtorrent_install.log
  chown -R merc:merc /media/downloads >> /tmp/rtorrent_install.log
  chown -R merc:merc /home/merc >> /tmp/rtorrent_install.log
  echo done
fi

echo -n Configuring Lighttpd and Rtorrent...

echo "trackers.numwant.set = -1" >> /home/merc/.rtorrent.rc
echo "dht.mode.set = disable" >> /home/merc/.rtorrent.rc
echo "protocol.pex.set = no" >> /home/merc/.rtorrent.rc
echo "trackers.use_udp.set = no" >> /home/merc/.rtorrent.rc
echo "network.http.max_open.set = 256" >> /home/merc/.rtorrent.rc
echo "network.max_open_files.set = 512" >> /home/merc/.rtorrent.rc

echo "# Memory resource usage (increase if you have a large number of items loaded," >> /home/merc/.rtorrent.rc
echo "# and/or the available resources to spend)" >> /home/merc/.rtorrent.rc
echo "pieces.memory.max.set = 8192M" >> /home/merc/.rtorrent.rc
echo "network.xmlrpc.size_limit.set = 16M" >> /home/merc/.rtorrent.rc

echo 'log.open_file = "rtorrent", /config/log/rtorrent/rtorrent.log' >> /home/merc/.rtorrent.rc
echo 'log.add_output = "info", "rtorrent"' >> /home/merc/.rtorrent.rc

echo "execute = {sh,-c,/usr/bin/php /usr/local/www/rutorrent/php/initplugins.php &}" >> /home/merc/.rtorrent.rc

sed -i '' -e 's+#directory =.*+directory = /media/downloads/incoming/+g' /home/merc/.rtorrent.rc >> /tmp/rtorrent_install.log
sed -i '' -e 's+#directory =.*+directory = /media/downloads/incoming/+g' ~/.rtorrent.rc >> /tmp/rtorrent_install.log
sed -i '' -e 's+#session =.*+session = /media/appdata/rtorrent1/.session/+g' /home/merc/.rtorrent.rc >> /tmp/rtorrent_install.log
sed -i '' -e 's+#session =.*+session = /media/appdata/rtorrent1/.session/+g' ~/.rtorrent.rc >> /tmp/rtorrent_install.log
sed -i '' -e 's+#port_range.*+port_range = 500${portoffset}-500${portoffset}+g' /home/merc/.rtorrent.rc >> /tmp/rtorrent_install.log
sed -i '' -e 's+#port_range.*+port_range = 500${portoffset}-500${portoffset}+g' ~/.rtorrent.rc >> /tmp/rtorrent_install.log
echo "scgi_port = 127.0.0.1:50${portoffset}" >> /home/merc/.rtorrent.rc
echo "scgi_port = 127.0.0.1:50${portoffset}" >> ~/.rtorrent.rc
sed -i '' -e 's+$scgi_port.*+$scgi_port = 50${portoffset};+g' /usr/local/www/rutorrent/conf/config.php >> /tmp/rtorrent_install.log
sed -i '' -e 's+server.document-root =.*+server.document-root = "/usr/local/www/rutorrent"+g' /usr/local/etc/lighttpd/lighttpd.conf >> /tmp/rtorrent_install.log
sed -i '' -e 's+#include "conf.d/fastcgi.conf".*+include "conf.d/fastcgi.conf"+g' /usr/local/etc/lighttpd/modules.conf >> /tmp/rtorrent_install.log
echo 'fastcgi.server = ( ".php" => ((' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '        "bin-path" => "/usr/local/bin/php-cgi",' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  "socket" => "/tmp/php.socket",' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  "max-procs" => 1,' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  "bin-environment" => (' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                            "PHP_FCGI_CHILDREN" => "3",' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                            "PHP_FCGI_MAX_REQUESTS" => "1000"' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  ),' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  "bin-copy-environment" => (' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                         "PATH", "SHELL", "USER"' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  ),' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                  "broken-scriptfilename" => "enable"' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo '                 )))' >> /usr/local/etc/lighttpd/conf.d/fastcgi.conf
echo done

echo -n Enable Lighttpd...
sysrc lighttpd_enable=yes >> /tmp/rtorrent_install.log
echo done

echo -n Creating rTorrent Start Script...
echo '#\!/bin/sh' >> /home/merc/rtorrent.sh
echo 'PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin' >> /home/merc/rtorrent.sh
echo 'export TERM=xterm' >> /home/merc/rtorrent.sh
echo 'screen -dmS screen_rtorrent rtorrent' >> /home/merc/rtorrent.sh
chmod 777 /home/merc/rtorrent.sh >> /tmp/rtorrent_install.log
chown merc:merc /home/merc/rtorrent.sh >> /tmp/rtorrent_install.log
sed -i '' -e 's+.*curl.*+                "curl"  => '\''/usr/local/bin/curl'\'',+g' /usr/local/www/rutorrent/conf/config.php >> /tmp/rtorrent_install.log
echo done

echo -n Modifying Crontab...
echo "SHELL=/bin/sh" >> /var/cron/tabs/root
echo "PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin" >> /var/cron/tabs/root
echo "@reboot /home/merc/rtorrent.sh" >> /var/cron/tabs/root
echo done
