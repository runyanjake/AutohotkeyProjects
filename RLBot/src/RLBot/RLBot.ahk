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

F7::	
	xstart:= 1
	ystart := 1
	Gui,Add,Picture,,nores.png
	Gui,Show
	Sleep, 10000
	ImageSearch, xstart, ystart, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_WorkingDir%/nores.png
	if (ErrorLevel = 2){
 		FileAppend, Could not conduct the search for image.,`r`n log.txt
	}else if (ErrorLevel = 1){
    		FileAppend, Image could not be found on the screen.`r`n, log.txt
	}else{
		FileAppend, Coords of image: %xstart%  %ystart% `r`n, log.txt
	}

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
		broken()
	}
	remainder := (mod(timer, 20))
	if(remainder == 0){
		resetnores()
	}
	noresmessage()
	startmessage()
	okbutton()
	Sleep, sleep_time*20
}

resetnores(){
	Send {Click 1030,600} 
}

noresmessage(){
	xnres:= 0
	ynres := 0
	ImageSearch, xnres, ynres, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_WorkingDir%/nores.png
	if (ErrorLevel = 2){
 		FileAppend, Could not conduct the search for image nores.,`r`n log.txt
	}else if (ErrorLevel = 1){
    		FileAppend, Image nores could not be found on the screen.`r`n, log.txt
	}else{
		FileAppend, Coords of image nores: %xnres%  %ynres% `r`n, log.txt
	}
}

startmessage(){
	ImageSearch, xnres, ynres, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_WorkingDir%/start.png
	if (ErrorLevel = 2){
 		FileAppend, Could not conduct the search for image start.,`r`n log.txt
	}else if (ErrorLevel = 1){
    		Sleep, 100
	}else{
		Sleep, 5000
		glhf()
		Sleep, 2000
		broken()
	}
}

okbutton(){
	FileAppend, Trying to look for ok button...`r`n, log.txt
	ImageSearch, xnres, ynres, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %A_WorkingDir%/okbutton.png
	if (ErrorLevel = 2){
 		FileAppend, Could not conduct the search for image okbutton.,`r`n log.txt
	}else if (ErrorLevel = 1){
    		FileAppend, Not Found`r`n, log.txt
	}else{
		FileAppend, Coords of image okbutton: %xnres%  %ynres% `r`n, log.txt
	}
}

broken(){
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

glhf(){
	Send, {t}
	Send, {g}
	Send, {l}
	Send, {h}
	Send, {f}
	Send, {ENTER}
}

exit(timer, err){
	FileAppend, Exited with error status %err%. %timer% iterations were made.`r`n`r`n, log.txt
	ExitApp
	Return	
}
