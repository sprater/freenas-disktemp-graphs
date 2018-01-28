#!/bin/bash

wdir=`dirname $0`

cd $wdir

cat /etc/local/sudoers | grep -v SMARTCTL > .sudoers.tmp
cat sudoers-snippet.txt >> .sudoers.tmp
cp -p /etc/local/sudoers /etc/local/sudoers.BAK-$$
cp .sudoers.tmp /etc/local/sudoers
cp .sudoers.tmp /conf/base/etc/local/sudoers
rm .sudoers.tmp

cp -p /usr/local/www/freenasUI/reporting/rrd.py /usr/local/www/freenasUI/reporting/rrd.py.BAK-$$
cp rrd.py /usr/local/www/freenasUI/reporting/rrd.py

cp -p /usr/local/www/freenasUI/reporting/urls.py /usr/local/www/freenasUI/reporting/urls.py.BAK-$$
cp urls.py /usr/local/www/freenasUI/reporting/urls.py

cp /usr/local/etc/collectd.conf /usr/local/etc/collectd.conf.BAK-$$
cp collectd.conf /usr/local/etc/collectd.conf
cp collectd.conf /conf/base/etc/local/collectd.conf

cp collectd_disktemp.sh /usr/local/bin
chmod 755 /usr/local/bin/collectd_disktemp.sh

service collectd restart
service nginx restart
service django restart
