# Documentation

## 1. IPv4 Manual IP Debian 12

```sh
ip add show
```
Note down the name of the interface you want to assign a static IP
```sh
nmcli connection
```
Get the connection name
```sh
sudo nmcli connection modify 'Wired connection 1' ipv4.address 192.168.0.XXX/24
```
```sh
sudo nmcli connection modify 'Wired connection 1' ipv4.gateway 192.168.0.1
```
```sh
sudo nmcli connection modify 'Wired connection 1' ipv4.method manual
```
```sh
sudo nmcli connection modify 'Wired connection 1' ipv4.dns '1.1.1.1'
```
```sh
sudo nmcli connection down 'Wired connection 1'; sudo nmcli connection up 'Wired connection 1'
```
Check IP address
```sh
ip add show enp0s3
```

## Secure SSH

[Link](https://gist.github.com/boseji/c9e91ff3bd0b3cfb62a5e260fe505374) to what i found, wich is based on [this](https://www.jeffskinnerbox.me/posts/2016/Apr/27/howto-set-up-the-raspberry-pi-as-a-headless-device/).

[Link](https://www.linode.com/docs/guides/use-public-key-authentication-with-ssh/)

### Disable root login

Edit `sshd_config`

```sh
sudo nano /etc/ssh/sshd_config
```

Make sure this variables are as follows

```
PermitRootLogin no
PasswordAuthentication yes
```

Test if new configuration works before restarting ssh daemon

```sh
sudo sshd -t
```

And then restart

```sh
sudo systemctl restart ssh
```

### Only allow ssh keypair login

Generate a keypair un client

```sh
ssh-keygen -t ed25519 -C "user@domain.tld"
```

Copy public key to server (change `ed25519` to specific key)

```sh
ssh-copy-id -i ed25519 [user]@[ip-address]
```

Then proceed to test to connect using keypair (change `ed25519` to specific key)

```sh
ssh -i ed25519 [user]@[ip-address]
```

If this is successful, proceed to disable `PasswordAuthentication` in `sshd_config`

```sh
sudo nano /etc/ssh/sshd_config
```

```conf
PasswordAuthentication no
````

## Install Docker

[Link](https://docs.docker.com/engine/install/debian/)

## Install Portainer

[Link](https://docs.portainer.io/2.23/start/install-ce/server/docker/linux)


## Install UFW

## Install Fail2Ban

## Check other documentation
https://github.com/shaderecker/ansible-pihole/
