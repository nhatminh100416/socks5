sudo apt-get update &&  echo y | sudo apt-get install dante-server nginx && sudo sh -c "sudo echo '
logoutput: stderr
user.privileged: root
user.unprivileged: nobody
user.libwrap: nobody
internal: ens4  port = 9966
external: ens4
method: username none
client pass {
  from: 0.0.0.0/0 to: 0.0.0.0/0
}
pass {
  from: 0.0.0.0/0 to: 0.0.0.0/0
} ' > /etc/danted.conf" && sudo systemctl enable danted nginx && sudo service danted start &&  sudo service nginx start