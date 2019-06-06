#!/bin/bash
# called by a crontab job on the hour to emulate a Grandfather Clock
# This script provides the ability to determinie the hour, and as a result,
# make a noise every hour on the hour like a clock.

# Crontab Entry:
# 0 * * * * /home/goij/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null
# Play the 15 minute sound:
#15  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/ZachGrandmaClock15.mp3 > /dev/null 2>/dev/null&
# Play the 30 minute sound:
#30  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/ZachGrandmaClock30.mp3 > /dev/null 2>/dev/null&
# Play the 45 minute sound:
#45  *  *  *  *  sudo /usr/bin/mpg123 /home/goij/OijpaClock/ZachGrandmaClock45.mp3 > /dev/null 2>/dev/null&
# Play Tick Tock every minute
#*  *  *  *  *  sudo /usr/bin/omxplayer /home/goij/OijpaClock/TickTock.mp3 > /dev/null 2>/dev/null&
# Flash a 3 LED LED for about a second every minute
#*  *  *  *  *  sudo /home/goij/bin/fl3-1&

# Still need to adjust volume higher for Jack, and lower for the "bong."
# And then back to origional volume.

HOUR=`date +%H`

echo $HOUR

cd /home/goij/OijpaClock

/home/goij/bin/fl3&
sudo amixer set PCM 90% >/dev/null 2>/dev/null

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

sudo amixer set PCM 95% >/dev/null 2>/dev/null
#sudo mpg123 PDDong.mp3 > /dev/null 2>/dev/null
sudo mpg123 $HOUR.mp3 > /dev/null 2>/dev/null
sudo mpg123 Westminster.mp3 > /dev/null 2>/dev/null

HOURCOUNT="0"
while [ $HOURCOUNT -lt $HOUR ]; do
	sudo mpg123 ZDong6.mp3 > /dev/null 2>/dev/null
	HOURCOUNT=`expr $HOURCOUNT + 1`
done
sudo amixer set PCM 90% >/dev/null 2>/dev/null
sudo mpg123 $HOUR.mp3 > /dev/null 2>/dev/null
sudo amixer set PCM 80% >/dev/null 2>/dev/null
#echo "$HOUR O Clock" | sudo espeak -a 175 >/dev/null 2>/dev/null
echo "$HOUR O Clock" | sudo espeak -p 60 -s 120 -a 175 > /dev/null 2>/dev/null
sudo amixer set PCM 90% >/dev/null 2>/dev/null
