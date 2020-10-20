#!/bin/sh
STORED="";
while true
do
    if [ -f "$HOME/.dropbox-dist/VERSION" ]; then
        CUR="$(dropbox-cli status)";
        if [ "$STORED" != "$CUR" ]; then
            STORED="$CUR"
            echo "${STORED}"
        fi
    fi
    sleep 5
done
