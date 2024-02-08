#!/bin/sh
DSCL_DB="/Volumes/Macintosh HD/var/db/dslocal/nodes/Default"
USERNAME="breakin"
PASSWORD=$1
UID="101"
GID="20"

dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME UserShell /bin/zsh
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME RealName $USERNAME
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME UniqueID "$UID"
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME PrimaryGroupID "$GID"
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME NFSHomeDirectory /Users/$USERNAME
dscl -f "$DSCL_DB" localonly -passwd /Local/Target/Users/$USERNAME $PASSWORD
dscl -f "$DSCL_DB" localonly -append /Local/Target/Groups/admin GroupMembership $USERNAME
echo "Done."