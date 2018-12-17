#!/bin/bash
# called by a crontab job on the hour to emulate a Grandfather Clock
# This script provides the ability to determinie the hour, and as a result,
# make a noise every hour on the hour like a clock.

# Crontab Entry:
# 0 * * * * $HOME/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null&

#Crontab Entries: (if using an id other than pi, change the home directory, and obviously uncomment them!)
# 0 * * * * $HOME/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null
# 15  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/Justice_15_min.mp3 > /dev/null 2>/dev/null&
# 30  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/Justice_30_min.mp3 > /dev/null 2>/dev/null&
# 45  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/Justice_45_min.mp3 > /dev/null 2>/dev/null&
# *  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/TickTock.mp3 > /dev/null 2>/dev/null&
HOUR=`date +%H`

#echo $HOUR

cd $HOME/OijpaClock

sudo mpg123 Westminster.mp3 > /dev/null 2>/dev/null
sudo mpg123 $HOUR.mp3 > /dev/null 2>/dev/null

if [ $HOUR -gt 11 ]; then
	PM="P M"
else
	PM="A M"
fi

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
#echo $HOUR
	

HOURCOUNT="0"
while [ $HOURCOUNT -lt $HOUR ]; do
	sudo mpg123 ZDong6.mp3 > /dev/null 2>/dev/null
	HOURCOUNT=`expr $HOURCOUNT + 1`
done
echo "The time was $HOUR Oy Clock $PM, before the first dong!" | sudo festival --tts
