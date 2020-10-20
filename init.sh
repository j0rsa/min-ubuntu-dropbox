#!/bin/sh

# This script is to create a new user with the given user and group ID and run the specified command as him.

UID=${UID:-1000}
GID=${GID:-1000}

if ! grep -q "$UID:$GID" "/etc/passwd"; then
    addgroup --gid $GID dbox
    adduser --system --disabled-password --no-create-home --home /dbox --shell /bin/sh --uid $UID --group dbox
fi

chown -R $UID:$GID /dbox

su -s /bin/sh -c "$@" dbox
