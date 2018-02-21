#! /bin/bash

yum install epel-release yum-utils -y

rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"

yum-config-manager --add-repo http://download.mono-project.com/repo/centos/

yum install wget mediainfo libzen libmediainfo curl gettext mono-core mono-devel sqlite.x86_64 -y

yum -y install wget git par2cmdline p7zip unrar unzip tar gcc python-feedparser python-configobj python-cheetah python-dbus python-devel libxslt-devel

useradd sonarr -s /sbin/nologin

wget http://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz
tar -xvf ~/NzbDrone.master.tar.gz -C /opt/
rm -f NzbDrone.master.tar.gz
mkdir /opt/sonarr
mkdir /opt/sonarr/bin
mv /opt/NzbDrone/* /opt/sonarr/bin
rm -rf /opt/NzbDrone

chown -R sonarr:sonarr /opt/sonarr

echo "
[Unit]
    Description=Sonarr Daemon
    After=syslog.target network.target
[Service]
    User=sonarr
    Group=sonarr
    Type=simple
    ExecStart=/usr/bin/mono /opt/sonarr/bin/NzbDrone.exe -nobrowser -data /opt/sonarr
    TimeoutStopSec=20
[Install]
    WantedBy=multi-user.target
" >> /usr/lib/systemd/system/sonarr.service

systemctl enable sonarr.service

systemctl start sonarr.service
