#!/bin/sh
#

wget -O /var/volatile/tmp/chocholousek-picons_01_all.ipk "https://raw.githubusercontent.com/emilnabil/emil_script_package/main/chocholousek-picons_01_all.ipk"
wait
opkg install --force-overwrite /tmp/*.ipk
wait
rm -f /var/volatile/tmp/chocholousek-picons_01_all.ipk
wait
sleep 2;
exit 0
