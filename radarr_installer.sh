# NLOG bug - https://github.com/Radarr/Radarr/issues/2585

yum install epel-release yum-utils -y
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
yum install wget mediainfo libzen libmediainfo curl gettext mono-core mono-devel sqlite.x86_64 -y
yum -y install wget git par2cmdline p7zip unrar unzip tar gcc python-feedparser python-configobj python-cheetah python-dbus python-devel libxslt-devel
useradd radarr -s /sbin/nologin
wget $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )
tar -xvf Radarr*.tar.gz -C /opt/
chown -R radarr:radarr /opt/Radarr

echo "
[Unit]
    Description=Radarr Daemon
    After=syslog.target network.target
[Service]
    User=radarr
    Group=radarr
    Type=simple
    ExecStart=/usr/bin/mono --debug /opt/Radarr/Radarr.exe -nobrowser -data /opt/Radarr
    TimeoutStopSec=20
    KillMode=process
    Restart=on-failure
[Install]
    WantedBy=multi-user.target
" > /usr/lib/systemd/system/radarr.service

systemctl enable radarr.service

systemctl start radarr.service
