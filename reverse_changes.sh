#!/bin/sh
DSCL_DB="/Volumes/Macintosh HD/var/db/dslocal/nodes/Default"
USERNAME="breakin"

echo "Removing user account."
dscl -f "$DSCL_DB" localonly -delete /Local/Target/Users/$USERNAME
rm -rf "Volumes/Macintosh HD - Data/Users/$USERNAME"
echo "Done."