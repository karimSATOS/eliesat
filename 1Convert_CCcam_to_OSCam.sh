#!/bin/sh
cat /etc/CCcam.cfg > /tmp/CCcam.cfg
cat /etc/CCcamDATAx.cfg > /etc/CCcam.cfg
echo "" >> /etc/CCcam.cfg
grep -v '^ *$' /tmp/CCcam.cfg >> /etc/CCcam.cfg
rm -rf /tmp/CCcam.cfg
sleep 0
OUTPUT2='/tmp/server'
echo -n "Converting ....."
FS=" "
cat /etc/CCcam.cfg |grep -i "^C:.*"|while read line ; do
# F1=$(echo $line|cut -d"$FS" -f1)
SERVER=$(echo $line|cut -d"$FS" -f2)
PORT=$(echo $line|cut -d"$FS" -f3)
USER=$(echo $line|cut -d"$FS" -f4)
PASS=$(echo $line|cut -d"$FS" -f5)
# echo "SERVER: $SERVER PORT: $PORT USER: $USER PASS: $PASS"
echo -n "."
echo "[reader]" >> $OUTPUT2
echo "label = $SERVER" >> $OUTPUT2
echo "protocol = cccam" >> $OUTPUT2
echo "device = $SERVER,$PORT" >> $OUTPUT2
echo "user = $USER" >> $OUTPUT2		
echo "password = $PASS" >> $OUTPUT2		
echo "disablecrccws_only_for = 0E00:000000,0500:030B00,050F00;098C:000000;09C4:000000" >> $OUTPUT2
echo "inactivitytimeout = 30" >> $OUTPUT2
echo "group = 1" >> $OUTPUT2
echo "cccversion = 2.3.2" >> $OUTPUT2
echo "ccckeepalive = 1" >> $OUTPUT2
echo "audisabled = 0" >> $OUTPUT2
echo "disablecrccws = 0" >> $OUTPUT2 				
echo "" >> $OUTPUT2
done

cp /tmp/server /etc/tuxbox/config/oscam.server  >/dev/null 2>&1 </dev/null &
sleep 0
cp /tmp/server /etc/tuxbox/config/ncam.server  >/dev/null 2>&1 </dev/null &
sleep 0

rm -rf /tmp/server
echo ""
echo "888b     d888 888b    888        d8888  .d8888b.  8888888b.  "
echo "8888b   d8888 8888b   888       d88888 d88P  Y88b 888   Y88b "
echo "88888b.d88888 88888b  888      d88P888 Y88b.      888    888 "
echo "888Y88888P888 888Y88b 888     d88P 888  Y888b.    888   d88P "
echo "888 Y888P 888 888 Y88b888    d88P  888     Y88b.  888888888  "
echo "888  Y8P  888 888  Y88888   d88P   888       888, 888 T88b   "
echo "888   |   888 888   Y8888  d8888888888 Y88b  d88P 888  T88b  "
echo "888       888 888    Y888 d88P     888  8Y8888P8  888   T88b "
echo "                                                             "
echo "                                                             "
echo "*************************************************************"
echo "*                      Thank you                            *"
echo "*************************************************************"
####################################################################
/usr/MyScript/restart.sh
####################################################################
exit 0