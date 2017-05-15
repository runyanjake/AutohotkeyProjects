FormatTime, SystTime, , dddd dd/MM HH:mm:ss
FileAppend, ----Log entry %SystTime%.----`r`n, log.txt

^F12::
	ERROR_STATUS = 0
	itor = 0
	X_COORD = 0
	Y_COORD = 0

	loop, 20000000
	{	
		cratetrade()
		itor++
		Sleep, 1000000
	}
	exit(itor, ERROR_STATUS)

F6:: 
	FileAppend, Interrupt triggered. %itor% iterations were made. Exiting...`r`n`, log.txt
	exit(itor, ERROR_STATUS)


cratetrade(){
	newtrade()
	clickcrate1()
	clickcrate2()
	clickcrate3()
	clickcrate4()
	clickrhs()
	clickkey()
	clickoffer()
	notesplatsubmit()
}

exit(timer, err){
	FileAppend, Exited with error status %err%. %timer% iterations were made.`r`n`r`n, log.txt
	ExitApp
	Return	
}

moveup(){
	Send {PgUp}
	Sleep, 100
	Send {PgUp}
	Sleep, 100
	Send {PgUp}
	Sleep, 100
}

clickcrate1(){
	Sleep, 1000
	clicksearchbox()
	Sleep, 100
	crate1()
	Sleep, 100
	clickitem()
}

clickcrate2(){
	Sleep, 1000
	clicksearchbox()
	Sleep, 100
	crate2()
	Sleep, 100
	clickitem()
}

clickcrate3(){
	Sleep, 1000
	clicksearchbox()
	Sleep, 100
	crate3()
	Sleep, 100
	clickitem()
}

clickcrate4(){
	Sleep, 1000
	clicksearchbox()
	Sleep, 100
	crate4()
	Sleep, 100
	clickitem()
}

clickkey(){
	Sleep, 1000
	clicksearchbox()
	Sleep, 100
	key()
	Sleep, 100
	clickitem()
}

clickoffer(){
	Sleep, 1000
	clicksearchbox()
	Sleep, 100
	offer()
	Sleep, 100
	clickitem()
}

clicksearchbox(){
	Send {Click 710,780} 
	Sleep, 20
	Send {Click 710,780} 
	Sleep, 20
	Send {Click 710,780} 
	Sleep, 20
	Send {DEL}
}

clickitem(){
	Send {Click 404,918}
	Send {Click 400,920}
}

clickrhs(){
	Send {Click 1000,600}
}

crate(){
	Send, {c}
	Send, {r}
	Send, {a}
	Send, {t}
	Send, {e}
	Send, {SPACE}
}

crate1(){
	crate()
	Send, {1}
	Send, {ENTER}
}
crate2(){
	crate()
	Send, {2}
	Send, {ENTER}
}
crate3(){
	crate()
	Send, {3}
	Send, {ENTER}
}
crate4(){
	crate()
	Send, {4}
	Send, {ENTER}
}

key(){
	Send, {k}
	Send, {e}
	Send, {y}
	Send, {ENTER}
}

offer(){
	Send, {o}
	Send, {f}
	Send, {f}
	Send, {e}
	Send, {r}
	Send, {ENTER}
}

notesplatsubmit(){
	Sleep, 1000
	Send {PgDn}
	Sleep, 1000
	Send {Click 400,600}
	Send {L}
	Send {F}
	Send {SPACE}
	Send {t}
	Send {r}
	Send {a}
	Send {d}
	Send {e}
	Send {SPACE}
	Send {o}
	Send {n}
	Send {l}
	Send {y}
	Send {.}
	Send {ENTER}
	steamid()
	Send {Click 400,880}
	Sleep, 100
	Send {Click 400,930}
	Sleep, 2000
	Send {Click 400,1030}
	Sleep, 5000
}

steamid(){
	Send {w}
	Send {w}
	Send {w}
	Send {.}
	Send {s}
	Send {t}
	Send {e}
	Send {a}
	Send {m}
	Send {c}
	Send {o}
	Send {m}
	Send {m}
	Send {u}
	Send {n}
	Send {i}
	Send {t}
	Send {y}
	Send {.}
	Send {c}
	Send {o}
	Send {m}
	Send {/}
	Send {i}
	Send {d}
	Send {/}
	Send {g}
	Send {r}
	Send {a}
	Send {n}
	Send {d}
	Send {p}
	Send {i}
	Send {n}
	Send {n}
	Send {e}
	Send {r}
}

newtrade(){
	Send {Click 300,60} 
	Send {Delete}
	Send {h}
	Send {t}
	Send {t}
	Send {p}
	Send {s}
	Send {:}
	Send {/}
	Send {/}
	Send {r}
	Send {o}
	Send {c}
	Send {k}
	Send {e}
	Send {t}
	Send {-}
	Send {l}
	Send {e}
	Send {a}
	Send {g}
	Send {u}
	Send {e}
	Send {.}
	Send {c}
	Send {o}
	Send {m}
	Send {/}
	Send {t}
	Send {r}
	Send {a}
	Send {d}
	Send {i}
	Send {n}
	Send {g}
	Send {/}
	Send {n}
	Send {e}
	Send {w}
	Send {ENTER}
	Sleep, 5000
	moveup()
}
