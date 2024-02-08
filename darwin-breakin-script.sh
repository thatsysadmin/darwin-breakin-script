#!/bin/zsh
DSCL_DB="/Volumes/Macintosh HD/var/db/dslocal/nodes/Default"
USERNAME="breakin"
PASSWORD=$1
UID="101"
GID="20"

dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME
dscl -f "$DSCL_DB" localonly -create UserShell /bin/zsh
dscl -f "$DSCL_DB" localonly -create RealName $USERNAME
dscl -f "$DSCL_DB" localonly -create UniqueID "$UID"
dscl -f "$DSCL_DB" localonly -create PrimaryGroupID "$GID"
dscl -f "$DSCL_DB" localonly -create NFSHomeDirectory /Users/$USERNAME
dscl -f "$DSCL_DB" localonly -passwd $PASSWORD
dscl . -append /Groups/admin GroupMembership $USERNAME
echo "Done."