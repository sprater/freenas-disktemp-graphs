#!/bin/sh
# URL https://gist.github.com/Raboo/eda65914c4bcb2af2b32


# add following to sudo
# Cmnd_Alias SMARTCTL = /usr/local/sbin/smartctl
# operator ALL=(ALL) NOPASSWD: SMARTCTL

# add following to /usr/local/etc/collectd.conf
# LoadPlugin exec
# <Plugin exec>
#     Exec "operator:operator" "/usr/local/bin/collectd_temp.sh"
# </Plugin>
#
# after run 'sudo service collectd restart'


PATH=$PATH:/usr/local/bin:/usr/local/sbin
HOSTNAME="${COLLECTD_HOSTNAME:-localhost}"
INTERVAL="${COLLECTD_INTERVAL:-600}"
while true
do

  # HDD temperatures
  for i in $(sysctl -n kern.disks | awk '{for (i=NF; i!=0 ; i--) if(match($i, '/ada/')) print $i }' ) ; do
    echo PUTVAL $HOSTNAME/disk-$i/temperature interval=$INTERVAL `sudo /usr/local/sbin/smartctl -a -n standby /dev/$i | awk '/Temperature_Celsius/{DevTemp=$10;} /Serial Number:/{DevSerNum=$3}; /Device Model:/{DevVendor=$3; DevName=$4} END {printf "N:%s", DevTemp }'`;
  done

sleep $INTERVAL
done
