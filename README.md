# thsets, a quick 2hu set-tracking tool

* **F5** to record a capture (success)
* **F6** to record a failed attempt
* **F7** to start a new set
* Log files are seperated by day - you can rename them to seperate sets manually (new sets will continue to be saved in the default daily file)
* You can choose to play a sound after a number of attempts (cue to end the set? your choice)
  * That number can be changed at the top of the script along with other options.
* You can move the script to any directory (e.g. game folders) and it'll start recording attempts there - though you'll have to bring `sound.wav` along for sounds to work.
* You can also customize how attempts are rendered (when to add tabs and newlines (newlines take precedence))
* Feel free to change the script (and sound) to fit your needs!

**Note:** there's no easy way to change the sound volume from the script itself, but you can just change AHK's volume in the Volume Mixer.

**Setup:** simply install AutoHotKey and run the script.
