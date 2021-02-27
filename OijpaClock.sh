#!/bin/bash
# called by a crontab job on the hour to emulate a Grandfather Clock
# This script provides the ability to determinie the hour, and as a result,
# make a noise every hour on the hour like a clock.

# Crontab Entry:
# 0 * * * * $HOME/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null&

#Crontab Entries: (if using an id other than pi, change the home directory, and obviously uncomment them!)
# 0 * * * * $HOME/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null
# 15  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/Justice_15_min.mp3 > /dev/null 2>/dev/null&
# 30  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/Justice_30_min.mp3 > /dev/null 2>/dev/null&
# 45  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/Justice_45_min.mp3 > /dev/null 2>/dev/null&
# *  *  *  *  *  sudo omxplayer $HOME/OijpaClock/TickTock.mp3 > /dev/null 2>/dev/null&
HOUR=`date +%H`

cd $HOME/OijpaClock

# note that volume default is 0; make things softer with --vol -#
sudo omxplayer --vol -500 Westminster.mp3 > /dev/null 2>/dev/null
sudo omxplayer --vol -1500 $HOUR.mp3 > /dev/null 2>/dev/null

if [ $HOUR -gt 11 ]; then
	PM="P. M."
else
	PM="A. M."
fi

case $HOUR in
13)
	HOUR=1
	;;
14)
	HOUR=2
	;;
15)
	HOUR=3
	;;
16)
	HOUR=4
	;;
17)
	HOUR=5
	;;
18)
	HOUR=6
	;;
19)
	HOUR=7
	;;
20)
	HOUR=8
	;;
21)
	HOUR=9
	;;
22)
	HOUR=10
	;;
23)
	HOUR=11
	;;
esac

first_char="$(printf '%s' "$HOUR" | cut -c1)"
if [ $first_char -eq 0 ]; then
  HOUR=`echo $HOUR | sed -e 's/^.//'`
fi

# if using espeak, -a is amplitde, default is 100; -p is pitch, default is 50; -s is words per minute, default is 160
sudo espeak "Oy Vey! the time was $HOUR Oy Clock $PM, before the first dong!" -a 140 -p 90 -s 150 -w /tmp/time.wav
HOURCOUNT="0"
while [ $HOURCOUNT -lt $HOUR ]; do
        sudo omxplayer --vol -1000 ZDong6.mp3 > /dev/null 2>/dev/null
        HOURCOUNT=`expr $HOURCOUNT + 1`
done

sudo omxplayer --vol -1000 /tmp/time.wav >/dev/null 2>/dev/null
