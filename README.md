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

## Getting PUID and PGID Values
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