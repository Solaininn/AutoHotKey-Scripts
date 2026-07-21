; Sets script to false by default
Toggle := false

; This script saves your current window, then puts roblox in focus, presses a button, minimizes roblox and lastly switches back to the saved window
F3:: {
    Toggle := !Toggle

	while Toggle {
		WinGet, winid ,, A
		winactivate, Roblox
		send,{9}
		sleep, 100
		
		WinGetClass, var, A
		WinMinimize, A
		WinActivate ahk_id %winid%
		sleep, 1140000 ; Equal to 19 minutes
	}
}

Esc::ExitApp
