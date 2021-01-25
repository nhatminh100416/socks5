#!/bin/bash
interfaces=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'`
sudo apt-get update &&  echo y | sudo apt-get install dante-server && sudo sh -c "sudo echo '
logoutput: stderr
user.privileged: root
user.unprivileged: nobody
user.libwrap: nobody
internal: $interfaces  port = 9966
external: $interfaces
method: username none
client pass {
  from: 0.0.0.0/0 to: 0.0.0.0/0
}
pass {
  from: 0.0.0.0/0 to: 0.0.0.0/0
} ' > /etc/danted.conf" && sudo systemctl enable danted && sudo service danted start &&  sudo service nginx start
