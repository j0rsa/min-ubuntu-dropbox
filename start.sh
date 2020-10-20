#!/bin/sh

if [ ! -d /dbox/.dropbox-dist ]; then
    echo "Dropbox client not found, downloading... please wait..."
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    echo "Installed Dropbox version:" $(cat /dbox/.dropbox-dist/VERSION)
fi

# Remove pid file from previous run (if exists) as this can block container from restarting
rm -f /dbox/.dropbox/dropbox.pid

# Script to log the dropbox status every 5 seconds (if changed)
dropbox-status &

/dbox/.dropbox-dist/dropboxd
