#!/bin/bash
echo "Running entrypoint script."

# Get minecraft jarfile
echo "Downloading version $VERSION"
wget -q https://launcher.mojang.com/mc/game/$VERSION/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar -P /home/minecraft/

echo "Accepting eula..."
echo "# Generated via Docker on $(date)" > /minecraft-data/eula.txt
echo "eula=$EULA" >> /minecraft-data/eula.txt
if [ $? != 0 ]; then
  echo "ERROR: unable to write eula to /data. Please make sure attached directory is writable by uid=${UID}"
  exit 2
fi

exec "$@"
