#!/bin/bash
echo "Running entrypoint script."
chown -R minecraft /home/minecraft

# Get minecraft jarfile
echo "Downloading version 1.16.5"
wget -q https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar -P /home/minecraft/

echo "Accepting eula..."
echo "# Generated via Docker on $(date)" > /minecraft-data/eula.txt
echo "eula=$EULA" >> /minecraft-data/eula.txt
if [ $? != 0 ]; then
  echo "ERROR: unable to write eula to /data. Please make sure attached directory is writable by uid=${UID}"
  exit 2
fi

exec "$@"
