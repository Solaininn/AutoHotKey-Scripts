﻿#NoEnv
#Warn

#Persistent

; This script works to find the timing for the max force sword swing for mob farming by allowing the user to toggle between manual and auto to find the right click timing.

Toggle := False ; Initialize toggle to off

F2:: ; F2 toggles mouse click loop
    Toggle := !Toggle
    if (Toggle)
        SetTimer, ClickLoop, 10 ;
    else
        SetTimer, ClickLoop, Off ;
return

ClickLoop:
    Sleep 615 ; Adjust as needed
    Click down
    Click up
    Sleep 10 ; Adjust as needed
return