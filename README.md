# stuff
This is a collection of scripts that will be used in my homelab. I am currently on a mission to save user data only and automate server deployments.  


# Sonarr Installer
This will donwload all dependences, install Sonarr, and set it to start at bootup. It is essentially the instructions at  https://github.com/Sonarr/Sonarr/wiki/Installation-CentOS-7 thrown in a script. 

There is no error checking. It was tested on an LXC container running in Proxmox using the default CentOS template (centos-7-default_20171212_amd64.tar.xz)

You can run it with: 

``` curl -sSL https://raw.githubusercontent.com/williamson10/stuff/master/sonarr_installer.sh | bash ```


# Radarr Installer
This will donwload all dependences, install Radarr, and set it to start at bootup. This is a mashup of instructions found at:
* https://github.com/Radarr/Radarr/wiki/Autostart-on-Linux
* https://www.reddit.com/r/radarr/comments/5yhi3w/centos_7_installation/
* https://github.com/Radarr/Radarr/wiki/Installation#manually-install-radarr

There is no error checking. It was tested on an LXC container running in Proxmox using the default CentOS template (centos-7-default_20171212_amd64.tar.xz)

You can run it with: 

``` curl -sSL https://raw.githubusercontent.com/williamson10/stuff/master/radarr_installer.sh | bash ```


# Jackett Installer
This will donwload all dependences, install Jackett, and set it to start at bootup. This is a mashup of instructions found at:
* the minimal instructions at https://github.com/Jackett/Jackett
* my own tinkering 

There is no error checking. It was tested on an LXC container running in Proxmox using the default CentOS template (centos-7-default_20171212_amd64.tar.xz)

You can run it with: 

``` curl -sSL https://raw.githubusercontent.com/williamson10/stuff/master/jackett_installer.sh | bash ```

