#!/bin/sh
# Remove all packages
apt remove -y tigervnc xfce4 xfce4-terminal termux-x11 nano wget curl pulseaudio pavucontrol firefox chromium thunderbird xarchiver ristretto galculator evince mousepad vlc-qt ristretto && apt autoremove && apt purge -y tigervnc xfce4 xfce4-terminal termux-x11 nano wget curl pulseaudio pavucontrol firefox chromium thunderbird xarchiver ristretto galculator evince mousepad vlc-qt ristretto
# Remove all scripts
rm -r ~/.vnc
rm -r /data/data/com.termux/files/home/Desktop
rm /data/data/com.termux/files/usr/bin/portadesx-native-gui
rm /data/data/com.termux/files/usr/bin/startvnc
rm /data/data/com.termux/files/usr/bin/stopvnc
rm /data/data/com.termux/files/usr/bin/restartvnc
sed -i '/LD_PRELOAD=/system/lib64/libskcodec.so/d' $PREFIX/etc/bash.bashrc
sed -i '/pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1/d' $PREFIX/etc/bash.bashrc
