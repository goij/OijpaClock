OijpaClock

This script was created for raspberry pi's but can be used on any Linux or Unix system.
Create a $HOME/bin directory and link badjokes and rndjoke to it.
Shell Script and Sounds called by Cron Jobs for a Grandpa Clock (Also bad jokes)

To add assorted things to crontab, type 'crontab -e' and type:
# m h  dom mon dow   command
0 * * * * /home/pi/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null
15  *  *  *  *  sudo /usr/bin/mpg123 /home/pi/OijpaClock/ZachGrandmaClock15.mp3 > /dev/null 2>/dev/null&
30  *  *  *  *  sudo /usr/bin/mpg123 /home/pi/OijpaClock/ZachGrandmaClock30.mp3 > /dev/null 2>/dev/null&
45  *  *  *  *  sudo /usr/bin/mpg123 /home/pi/OijpaClock/ZachGrandmaClock45.mp3 > /dev/null 2>/dev/null&
*  *  *  *  *  sudo /usr/bin/mpg123 /home/pi/OijpaClock/TickTock.mp3 > /dev/null 2>/dev/null&

# This one takes 3 LED's connected; the /home/pi/pybin/fl3-1.py file must be ready.
# *  *  *  *  *  sudo /home/pi/bin/fl3-1 &
# This script shoots two lasers.
# *  *  *  *  *  /home/pi/bin/lasers1sec > /dev/null 2>/dev/null&
# This one runs bad jokes based on a pull-up resistor that gets pulled down with a switch:
#@reboot /home/pi/bin/runBadJoke > /dev/null 2>/dev/null&

...
You will need to add festival and espeak to your apps...
sudo apt-get update
sudo apt-get install festival espeak
