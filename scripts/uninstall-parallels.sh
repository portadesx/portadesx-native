#!/bin/sh
# Remove all packages
apt remove -y tigervnc xfce4 xfce4-terminal pavucontrol firefox chromium thunderbird xarchiver ristretto galculator evince mousepad vlc-qt ristretto && apt autoremove && apt purge -y tigervnc xfce4 xfce4-terminal pavucontrol firefox chromium thunderbird xarchiver ristretto galculator evince mousepad vlc-qt ristretto
# Remove all scripts
rm -r ~/.vnc
rm -r /data/data/com.termux/files/home/Desktop
rm /data/data/com.termux/files/usr/bin/portadesx-native-gui
rm /data/data/com.termux/files/usr/bin/startvnc
rm /data/data/com.termux/files/usr/bin/stopvnc
rm /data/data/com.termux/files/usr/bin/restartvnc
