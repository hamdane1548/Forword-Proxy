#!bin/bash
set -e
echo "Initialisation du cache Squid"
squid -z
rm -f /run/squid.pid
exec squid -N -d 1

