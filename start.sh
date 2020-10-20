#!/bin/sh

if [ ! -d ~/.dropbox-dist ]; then
    echo "Dropbox client not found, downloading... please wait..."
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - -C $HOME
    echo "Installed Dropbox version:" $(cat ~/.dropbox-dist/VERSION)
    
fi

# Remove pid file from previous run (if exists) as this can block container from restarting
rm -f ~/.dropbox/dropbox.pid

# Script to log the dropbox status every 5 seconds (if changed)
dropbox-status &

~/.dropbox-dist/dropboxd
