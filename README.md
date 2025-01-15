# Fedora build

## Disable swap

```
sudo swapoff -a
```

## wezterm

```
sudo dnf install -y https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203_110809_5046fc22-1.fedora39.x86_64.rpm
```

Conf file is located at `/home/<user>/.wezterm.lua`.

## Generic DNF packages

```
sudo dnf install neofetch python-pip nmap qbittorrent htop thunderbird binwalk screen
```

## fish

```
sudo dnf install fish
```

Make fish the default shell for current user:

```
chsh -s $(which fish)
```

Remove greeting message:

```
set -Ux fish_greeting
```

## bat

```
sudo dnf install bat
set -Ux BAT_THEME base16
```

## Wireshark

```
sudo dnf install wireshark
```

Add our user to the `wireshark` group so that we can use it without sudo privileges:

```
sudo usermod -a -G wireshark <user>
```

## GNOME

Installed GNOME Tweaks and Extensions. Installed and configured the following extensions (some of them allow export/import of config):

*   ArcMenu
*   Astra Monitor (display IO storage and network)
*   Caffeine
*   Clipboard Indicator
*   Dash to Panel
*   Desktop Icons NG (DING)
*   Top Bar Organizer
*   Vitals (display temperature, memory, CPU and fan)

Added the following shortcuts:

*   `super + Q` to close.
*   `super + enter` to open terminal.
*   `alt + tab` to switch windows.

## VS Code

Install key and repo:

```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
```

Update and install package:

```
sudo dnf check-update
sudo dnf install code
```

## veracrypt

https://veracrypt.eu/en/Downloads.html

## VLC

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf install vlc
sudo dnf group install Multimedia
```

## Burp

https://portswigger.net/burp/releases/professional-community-2024-7-6?requestededition=community&requestedplatform=

## Ghidra

Downloaded release from github at https://github.com/NationalSecurityAgency/ghidra/releases into `/usr/lib/ghidra`

Installed java development SDK:

```
sudo dnf install java-latest-openjdk-devel
```

Linked start script to `~/bin`.

Created a desktop shortcut at `/usr/share/applications/ghidra.desktop`:

```
[Desktop Entry]
Version=10.0
Type=Application
Terminal=false
Icon=/opt/ghidra/support/ghidra.ico
Exec=sh /home/<user>/bin/ghidra
Name=Ghidra
```

The icon is not rendered correctly because GNOME thinks is 128x128 although it is 256x256. Rescaling it fixes the problem.


## Go tools

Install Go:

```
sudo dnf install golang
```

Setup GO env vars:

```
set -Ux GOPATH $HOME/go
fish_add_path $GOPATH/bin
```

```
go install github.com/ffuf/ffuf@latest
go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/haccer/subjack@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
```

## SecLists

```
sudo git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists
```

## SQLmap

```
sudo git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap && sudo sed -i "s/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python3/" /opt/sqlmap/sqlmap.py && sudo ln -s /opt/sqlmap/sqlmap.py ~/bin/sqlmap
```

## GEF (extension for GDB)

```
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
```

## GDB static

```
sudo git clone https://github.com/hugsy/gdb-static.git /opt/gdb-static
```

## Jekyll

Install dependencies:

```
sudo dnf install ruby ruby-devel openssl-devel redhat-rpm-config gcc-c++ @development-tools
```

Add Ruby env vars:

```
set -Ux GEM_HOME $HOME/gems
mkdir $HOME/gems/bin
fish_add_path $HOME/gems/bin
```

Install Jekyll

```
gem install jekyll bundler
```

## Obsidian

Installed AppImage from https://obsidian.md/download

```
sudo mkdir /opt/obsidian/
sudo mv Obsidian.AppImage /opt/obsidian
sudo chmod u+x /opt/obsidian/Obsidian.AppImage
```

Downloaded icon from https://obsidian.md/blog/new-obsidian-icon/

Created a desktop shortcut at `/usr/share/applications/obsidian.desktop`

```
[Desktop Entry]
Name=Obsidian
Comment=Markdown Notetaking App
GenericName=Text Editor
Type=Application
Exec=/opt/obsidian/obsidian %U
Icon=/opt/obsidian/obsidian.png
StartupWMClass=obsidian
MimeType=x-scheme-handler/obsidian;
```

## Discord

Downlaod from [official page](https://discord.com/).

```
sudo tar -xvzf discord-<version>.tar.gz -C /opt
sudo mkdir /opt/discord
sudo mv discord-<version>/Discord/* /opt/discord
sudo ln -s /opt/discord/Discord /usr/bin/Discord
```

Created a desktop shortcut at `/usr/share/applications/discord.desktop`

```
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your deskt>
GenericName=Internet Messenger
Exec=/usr/bin/Discord
Icon=/opt/discord/discord.png
Type=Application
Categories=Network;InstantMessaging;
```
