# GANTICH Homelab

This project uses a .env file to manage environment variables. These variables are crucial for the proper functioning of the application. Please ensure that you set them correctly before running the application.

Environment Variables:

```env
PUID: User ID of the application owner.
PGID: Group ID of the application owner.
TZ: Timezone of the server (e.g., Europe/Madrid).
USERDIR: Path to the user's home directory.
DOCKERDIR: Path to the Docker directory.
SECRETSDIR: Path to the Docker secrets directory.
SERVER_IP: IP address of the server.
DATADIR: Path to the main data directory.
MOVIESDIR: Path to the directory containing movies.
SERIESDIR: Path to the directory containing TV series.
MUSICDIR: Path to the directory containing music.
BOOKSDIR: Path to the directory containing books.
```
---

## Getting PUID and PGID Values
To find your PUID (User ID) and PGID (Group ID), open a terminal and run the following command:

```console
foo@bar:~$ id
uid=1000(foo) gid=1000(foo) groups=1000(foo)...
```

Look for the uid (user ID) and gid (group ID) values in the output. Use these values in your .env file.

Important Notes
Keep the .env file secure and do not share it with others, as it may contain sensitive information.
Double-check that the paths and values are accurate for your system.
This should guide users on how to find their PUID and PGID values using the id command. Let me know if there's anything else you'd like to add or modify!
---

## qBitTorrent + Wireguard VPN

After trying:
- lscr.io/linuxserver/qbittorrent + qmcgaw/gluetun (Unable to connect Prowlarr with Sonarr after passing Prowlarr through gluetun)
- ghcr.io/hotio/qbittorrent (unable to finish config and access WebUI)
- binhex/arch-qbittorrentvpn (All ok)

Last one worked perfectly.

For config related issues go to https://hub.docker.com/r/binhex/arch-qbittorrentvpn/

Proceeded as follows:
- Add service to stack, with config:
```docker-compose
qbittorrent:
    container_name: qbittorrentvpn
    image: binhex/arch-qbittorrentvpn
    ports:
      - 8080:8080
      - 8118:8118
      - 6881:6881
      - 6881:6881/udp
    environment:
      - PUID=$PUID
      - PGID=$PGID
      - UMASK=002
      - TZ=$TZ
      - VPN_ENABLED=yes
      - WEBUI_PORT=8080
      - LAN_NETWORK=192.168.0.0/24
      - ENABLE_PRIVOXY=yes
      - VPN_PROV=custom
      - VPN_CLIENT=wireguard
    volumes:
      - $DOCKERDIR/qbittorrent:/config
      - $USERDIR/downloads:/data
      - /etc/localtime:/etc/localtime:ro
    cap_add:
      - NET_ADMIN

    privileged: true
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv6.conf.all.disable_ipv6=1
```
After starting first time, folders are created. In path `~/docker/qbittorrent/wireguard` add `wg0.conf` copying data from the downloaded wireguard config of vpn provider. Since IPv6 was disabled, remove all `ip6tables` commands from it.

Finally, in order to use Privoxy with certain ISP-blocked trackers, go to Prowlarr > Settings > Indexers > HTTP and add

- name: Privoxy
- tags: privoxy
- host: qbittorrentvpn
- port: 8118

Then proceed to go to the desired indexer in Prowlarr > Indexers, edit (left-most wrench icon) and add

- tags: privoxy
