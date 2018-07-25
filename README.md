OijpaClock

This set of sounds and shellscript were created for Raspberry Pi's but can be used on
virtually any Linux or Unix system.
Must have a speaker to make it "annoying or enjoyable."
...
You will need to add festival and/or espeak to your apps...
(For Ubuntu / Raspbian / Debian distros) ...
sudo apt-get update
sudo apt-get install festival espeak

Create a $HOME/bin directory and link badjokes and rndjoke to it.
Shell Script and Sounds called by Cron Jobs for a Grandpa Clock (Also bad jokes)

To add assorted things to crontab, type 'crontab -e' and type:
(note that this is desined for the pi or other user for the crontab)
# m h  dom mon dow   command
@reboot $HOME/OijpaClock/rndjoke > /dev/null 2>/dev/null&
0 * * * * $HOME/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null
15  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/Justice_15_Min.mp3 > /dev/null 2>/dev/null&
30  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/Justice_30_Min.mp3 > /dev/null 2>/dev/null&
45  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/Justice_45_Min.mp3 > /dev/null 2>/dev/null&
*  *  *  *  *  sudo /usr/bin/mpg123 $HOME/OijpaClock/TickTock.mp3 > /dev/null 2>/dev/null&
