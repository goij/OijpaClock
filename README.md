OijpaClock

This set of sounds and shellscript were created for Raspberry Pi's but can be used on
virtually any Linux or Unix system.
Must have a speaker to make it "annoying or enjoyable."
...
You will need to add espeak to your apps for a text to speach synthesizer...
sudo apt-get update
sudo apt-get install -y espeak

Also, the omxplayer is a decent .wav, and .mp3 player...
sudo apt-get install -y omxplayer

Create a $HOME/bin directory and link badjokes and rndjoke to it...
cd $HOME
mkdir bin
ln OijpaClock/rndjoke bin
ln OijpaClock/badjokes bin

Shell Script and Sounds called by Cron Jobs for a Grandpa Clock (Also bad jokes)

To add assorted commands to crontab, type 'crontab -e' and type:
(note that this is designed for the pi or other user for the crontab):
# m h  dom mon dow   command
@reboot $HOME/OijpaClock/rndjoke > /dev/null 2>/dev/null&
0 * * * * $HOME/OijpaClock/OijpaClock.sh > /dev/null 2>/dev/null&
15  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/Justice_15_Min.mp3 > /dev/null 2>/dev/null&
30  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/Justice_30_Min.mp3 > /dev/null 2>/dev/null&
45  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/Justice_45_Min.mp3 > /dev/null 2>/dev/null&
*  *  *  *  *  sudo omxplayer --vol -2000 $HOME/OijpaClock/TickTock.mp3 > /dev/null 2>/dev/null&
