#!/bin/sh
# Setup storage Termux
termux-setup-storage

# Install xfce4 desktop environment, apps, and utility
apt update
apt upgrade -y -o Dpkg::Options::="--force-confold"
apt install -y x11-repo
apt install -y tigervnc xfce4 xfce4-terminal termux-x11 nano wget curl pulseaudio pavucontrol 

# Install user apps
apt install -y firefox chromium thunderbird xarchiver ristretto galculator evince mousepad vlc-qt ristretto
mkdir -p /data/data/com.termux/files/home/Desktop
ln -s /data/data/com.termux/files/usr/share/applications/firefox.desktop /data/data/com.termux/files/home/Desktop/firefox.desktop
ln -s /data/data/com.termux/files/usr/share/applications/chromium.desktop /data/data/com.termux/files/home/Desktop/chromium.desktop
ln -s /data/data/com.termux/files/usr/share/applications/xarchiver.desktop /data/data/com.termux/files/home/Desktop/xarchiver.desktop
ln -s /data/data/com.termux/files/usr/share/applications/thunderbird.desktop /data/data/com.termux/files/home/Desktop/thunderbird.desktop
ln -s /data/data/com.termux/files/usr/share/applications/xfce4-terminal.desktop /data/data/com.termux/files/home/Desktop/xfce4-terminal.desktop
ln -s /data/data/com.termux/files/usr/share/applications/org.gnome.Evince.desktop /data/data/com.termux/files/home/Desktop/org.gnome.Evince.desktop
ln -s /data/data/com.termux/files/usr/share/applications/org.xfce.ristretto.desktop /data/data/com.termux/files/home/Desktop/org.xfce.ristretto.desktop
ln -s /data/data/com.termux/files/usr/share/applications/galculator.desktop /data/data/com.termux/files/home/Desktop/galculator.desktop
ln -s /data/data/com.termux/files/usr/share/applications/org.xfce.mousepad.desktop /data/data/com.termux/files/home/Desktop/org.xfce.mousepad.desktop\
ln -s /data/data/com.termux/files/usr/share/applications/vlc.desktop /data/data/com.termux/files/home/Desktop/vlc.desktop
ln -s /storage/emulated/0 /data/data/com.termux/files/home/Desktop/android_files

# PulseAudio at startup on bash.bashrc
echo 'LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> $PREFIX/etc/bash.bashrc

# PulseAudio at Setup
LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Set up X11 startup script
cat  <<EOF >  /data/data/com.termux/files/usr/bin/portadesx-native-gui
#!/bin/sh
export XDG_RUNTIME_DIR=/data/data/com.termux/files/usr/tmp
kill -9 $(pgrep -f "termux.x11")\ 2>/dev/null
kill -9 $(pgrep -f "X11")\ 2>/dev/null
termux-x11 :0 >/dev/null &
export PULSE_SERVER=127.0.0.1
DISPLAY=:0 xfce4-session
# DISPLAY=:0 startlxqt
# DISPLAY=:0 mate-session
EOF

chmod +x /data/data/com.termux/files/usr/bin/portadesx-native-gui

# Set up VNC server configuration
printf "12345678" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

echo '#!/data/data/com.termux/files/usr/bin/sh
export PULSE_SERVER=127.0.0.1
export DISPLAY=:1
xfce4-session 
# startlxqt
# mate-session' >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo '#!/data/data/com.termux/files/usr/bin/sh
vncserver -localhost
echo 'VNC server address: 127.0.0.1:1 Password: 12345678' >> /data/data/com.termux/files/usr/bin/start
chmod +x /data/data/com.termux/files/usr/bin/startvnc

echo '#!/data/data/com.termux/files/usr/bin/sh
vncserver -kill :1' >> /data/data/com.termux/files/usr/bin/stop
chmod +x /data/data/com.termux/files/usr/bin/stopvnc

echo '#!/data/data/com.termux/files/usr/bin/sh
stopvnc
startvnc' >> /data/data/com.termux/files/usr/bin/restart
chmod +x /data/data/com.termux/files/usr/bin/restartvnc

