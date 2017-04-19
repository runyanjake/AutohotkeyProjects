FormatTime, SystTime, , dddd dd/MM HH:mm:ss
FileAppend, ----Log entry %SystTime%.----`r`n, log.txt

^F12::
	ERROR_STATUS = 0
	itor = 0
	X_COORD = 0
	Y_COORD = 0

	loop, 20000000
	{	
		basicwloop(itor)
		itor++
	}
	exit(itor, ERROR_STATUS)

F6:: 
	FileAppend, Interrupt triggered. %itor% iterations were made. Exiting...`r`n`, log.txt
	exit(itor, ERROR_STATUS)

basicwloop(timer){
	sleep_time = 0
	Random, sleep_time, 50, 100
	loop, 5
	{
		Send, {W} 
		Sleep, sleep_time*2
		Send, {SPACE}
	}
	remainder := (mod(timer, 500))
	if(remainder == 0){
		sendmessage()
	}
	Sleep, sleep_time*20
}

startmessage(){
	xstart:= 1
	ystart := 1
	CoordMode Pixel
	ImageSearch, xstart, ystart, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_WorkingDir%/start.png
	if (ErrorLevel = 2){
 		FileAppend, Could not conduct the search for start image.,`r`n log.txt
	}else if (ErrorLevel = 1){
    		FileAppend, Start image could not be found on the screen.`r`n, log.txt
	}else{
		FileAppend, Coords of start: %xreplay%  %yreplay% `r`n, log.txt
	}
}

sendmessage(){
	Send, {t}
	Send, {s}
	Send, {r}
	Send, {y}
	Send, {SPACE}
	Send, {c}
	Send, {o}
	Send, {n}
	Send, {t}
	Send, {r}
	Send, {o}
	Send, {l}
	Send, {l}
	Send, {e}
	Send, {r}
	Send, {SPACE}
	Send, {b}
	Send, {r}
	Send, {o}
	Send, {k}
	Send, {e}
	Send, {n}
	Send, {ENTER}
}

exit(timer, err){
	FileAppend, Exited with error status %err%. %timer% iterations were made.`r`n`r`n, log.txt
	ExitApp
	Return	
}
