um install epel-release yum-utils -y
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
yum install wget mediainfo libzen libmediainfo curl gettext mono-core mono-devel mono-locale-extras sqlite.x86_64 -y
yum -y install wget git par2cmdline p7zip unrar unzip tar gcc python-feedparser python-configobj python-cheetah python-dbus python-devel libxslt-devel


jackettver=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep -E \/tag\/ | awk -F "[><]" '{print $3}')

wget $( curl -s https://api.github.com/repos/Jackett/Jackett/releases | grep Mono.tar.gz | grep browser_download_url | head -1 |cut -d \" -f 4 | head -1 | cut -d \" -f 4 )

useradd jackett -s /sbin/nologin

tar -xvf Jackett*

mkdir /opt/jackett
mv Jackett/* /opt/jackett

chown -R jackett:jackett /opt/jackett

echo "
[Unit]
    Description=Jackett Daemon
    After=syslog.target network.target
[Service]
    User=jackett
    Group=jackett
    Type=simple
    ExecStart=/usr/bin/mono --debug /opt/jackett/JackettConsole.exe --NoRestart
    TimeoutStopSec=20
    KillMode=process
    Restart=on-failure
[Install]
    WantedBy=multi-user.target
" >> /usr/lib/systemd/system/jackett.service

systemctl enable jackett.service

systemctl start jackett.service
