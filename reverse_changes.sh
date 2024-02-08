#!/bin/sh
VOLUMETARGET="Macintosh HD"
USERNAME="breakin"
DSCL_DB="/Volumes/$VOLUMETARGET/var/db/dslocal/nodes/Default"

echo "Removing user account."
dscl -f "$DSCL_DB" localonly -delete /Local/Target/Users/$USERNAME
rm -rf "Volumes/$VOLUMETARGET - Data/Users/$USERNAME"
echo "Done."