#!/bin/bash
# called by a crontab job on the hour to emulate a Grandfather Clock
# This script provides the ability to determinie the hour, and as a result,
# make a noise every hour on the hour like a clock.

# Crontab Entry:
# 0 * * * * /home/pi/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null

#Crontab Entries: (if using an id other than goij, change the home directory, and obviously uncomment them!)
# 0 * * * * /home/goij/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null
# 15  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/ZachGrandmaClock15.mp3 > /dev/null 2>/dev/null&
# 30  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/ZachGrandmaClock30.mp3 > /dev/null 2>/dev/null&
# 45  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/ZachGrandmaClock45.mp3 > /dev/null 2>/dev/null&
# *  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/tick.mp3 > /dev/null 2>/dev/null&
HOUR=`date +%H`

echo $HOUR

cd /home/pi/OijpaClock

sudo mpg123 Westminster.mp3 > /dev/null 2>/dev/null
sudo mpg123 $HOUR.mp3 > /dev/null 2>/dev/null

case $HOUR in
13)
	HOUR=01
	;;
14)
	HOUR=02
	;;
15)
	HOUR=03
	;;
16)
	HOUR=04
	;;
17)
	HOUR=05
	;;
18)
	HOUR=06
	;;
19)
	HOUR=07
	;;
20)
	HOUR=08
	;;
21)
	HOUR=09
	;;
22)
	HOUR=10
	;;
23)
	HOUR=11
	;;
esac
echo $HOUR
	

HOURCOUNT="0"
while [ $HOURCOUNT -lt $HOUR ]; do
	sudo mpg123 ZDong6.mp3 > /dev/null 2>/dev/null
	HOURCOUNT=`expr $HOURCOUNT + 1`
done
echo "The time is $HOUR of the clock or is it?" | sudo festival --tts