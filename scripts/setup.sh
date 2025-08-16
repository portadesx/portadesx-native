#!/bin/sh
# Install xfce4 desktop environment, apps, and utility
pkg update
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install -y x11-repo
pkg install -y tigervnc xfce4 xfce4-terminal termux-x11 nano wget curl pulseaudio pavucontrol firefox chromium thunderbird xarchiver ristretto galculator evince mousepad 

# PulseAudio at startup on bash.bashrc
echo 'LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1' >> $PREFIX/etc/bash.bashrc

# PulseAudio at Setup
LD_PRELOAD=/system/lib64/libskcodec.so
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Set up X11 startup script
cat  <<EOF >  ~/portadesx-native-xfce
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

# Set up VNC server configuration
printf "12345678" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

echo '#!/data/data/com.termux/files/usr/bin/sh
export DISPLAY=:6 
xfce4-session &
# startlxqt
# mate-session' >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

echo '#!/data/data/com.termux/files/usr/bin/sh
vncserver -localhost no :6
echo 'VNC server address: 127.0.0.1:6 Password: 12345678' >> /data/data/com.termux/files/usr/bin/start
chmod +x /data/data/com.termux/files/usr/bin/startvnc

echo '#!/data/data/com.termux/files/usr/bin/sh
vncserver -kill :6' >> /data/data/com.termux/files/usr/bin/stop
chmod +x /data/data/com.termux/files/usr/bin/stopvnc

echo '#!/data/data/com.termux/files/usr/bin/sh
stopvnc
startvnc' >> /data/data/com.termux/files/usr/bin/restart
chmod +x /data/data/com.termux/files/usr/bin/restartvnc

