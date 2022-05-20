#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
OnExit("ExitFunc")

tabEveryXAttempts = 5
newlineEveryXAttempts = 15
soundEveryXAttempts = 10
sound = %A_ScriptDir%\sound.wav

dir = %A_ScriptDir%\thsets
If !FileExist(dir){
	FileCreateDir, %dir% 
}

FormatTime, CurrentDate,, dd-MM-yy
FormatTime, CurrentTime,, HH:mm
file = %dir%\thsets-%CurrentDate%.txt
FileAppend,==============================`n, %file%
FileAppend,New set in progress... (%CurrentTime%)`n, %file%

cap = 0
total = 0
	
F5::  ; Capture
	FormatSet()
	FileAppend,-, %file%
	cap++
	total++
	PlaySound()
	return

F6::  ; Failure
	FormatSet()
	FileAppend,x, %file%
	total++
	PlaySound()
	return

F7::  ; New Set
	FinishSet()
	FileAppend,==============================`n, %file%
	FileAppend,New set in progress... (%CurrentTime%)`n, %file%
	cap = 0
	total = 0
	return

FormatSet()
{
	global cap, total, file, tabEveryXAttempts, newlineEveryXAttempts
	If (mod(total, newlineEveryXAttempts) == 0)
	{
		FileAppend,`n, %file%
	} else if (mod(total, tabEveryXAttempts) == 0){
		FileAppend,%A_Tab%, %file%
	}
}

FinishSet()
{
	global cap, total, file
	If(total == 0)
	{
		FileAppend,Set cancelled.`n`n, %file%
	} else {
		percent := Ceil(cap/total*100)
		FileAppend, `n%total%-set: %cap%/%total% (%percent%`%)`n`n, %file%
	}
}

PlaySound()
{
	;you can implement more complex sound-playing logic here if you want
	global total, soundEveryXAttempts, sound
	If (mod(total, soundEveryXAttempts) == 0)
	{
		SoundPlay, %sound%
	}
}

ExitFunc(){
	FinishSet()
}