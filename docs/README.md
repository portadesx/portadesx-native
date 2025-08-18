# Table of Contents
- [List of portadesx commands](https://github.com/portadesx/portadesx-native/blob/main/docs/README.md#list-of-portadesx-commands)
- [Default users password and vnc credentials](https://github.com/portadesx/portadesx-native/blob/main/docs/README.md#default-users-password-and-vnc-credentials)
- [Difference between Termux:X11 and VNC Session](https://github.com/portadesx/portadesx-native/blob/main/docs/README.md#Difference-between-Termux:X11-and-VNC-Session)
- [Apps launch warning](https://github.com/portadesx/portadesx-native/tree/main/docs#apps-launch-warning)
- [Update existing installation](https://github.com/portadesx/portadesx-native/blob/main/docs/README.md#update-existing-installation)
- [Upgrade to newer ubuntu release](https://github.com/portadesx/portadesx-native/blob/main/docs/README.md#upgrade-to-newer-ubuntu-release)
- [Office Software](https://github.com/portadesx/portadesx-native/blob/main/docs/README.md#office-software)

### List of portadesx-native commands
##### Termux Shell
- `portadesx-native-gui` - start X11 session
- `portadesx-native-help` - print help message
- `startvnc` - start vnc server
- `stopvnc` - stop vnc server
- `restartvnc` - restart vnc server

### Difference between Termux:X11 and VNC Session
X11 session excells speed so you can expect no lagging on gestures or video playback, but this can't be zoomed so this is make smaller screen not too comfortable. Meanwhile VNC graphics is a bit lagging meanwhile doing a gesture or playing a video but VNC can be zoomed and give convenience for smaller screen user but with sacrificing performance

### Apps launch warning
If you find out the warning when tried to launching application on desktop like this, simply click 'launch' since this warning aren't critical or dangerous.

![](https://github.com/portadesx/portadesx-screenshots/raw/f1eab1fe4e8b1d330d13f054995c791bab66ad00/termux-native/20250818/warning.jpg)

### Default vnc credentials
- Default VNC server address is `127.0.0.1:6`
- Default VNC password is `12345678`

### Update existing installation 
Usually that's always can be done with `apt update && apt upgrade -y` but if you want to keep configuration files, use `apt update && apt upgrade -y -o Dpkg::Options::="--force-confold"` instead

### Upgrade to newer ubuntu release
On PortadesX:Native updating package = upgrading installation because unlike Ubuntu used by other PortadesX editions, PortadesX:Native is running directly on Termux and the package is rolling release. And because of that nature, instability can occur usually on graphical environment unlike the other PortadesX editions, but rarely on command-line programs. 

### Office Software
We only include shortcut for Microsoft office online because we believe that only assured way to achieve 1:1 compatibility with windows office, but if you want offline access, we recommend [this chrome extensions](https://chromewebstore.google.com/detail/office-editing-for-docs-s/gbkeegbaiigmenfmjfclcdgdpimamgkj), made by google and widely used on chromebook
