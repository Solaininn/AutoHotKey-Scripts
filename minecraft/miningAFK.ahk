; Sets script to false by default
Toggle := false

; This script just moves the character left and right
F3:: ; F3 toggles the script
    Toggle := !Toggle
    if (Toggle) {
        SetTimer, ToggleKeys, 100 ; Check state every second
    } else {
        SetTimer, ToggleKeys, Off
        Send, {a up}{d up} ; Release both 'a' and 'd' keys when toggling off
    }
    return

ToggleKeys:
    if (Toggle) {
        Send, {a down}
        Sleep, 3200
        Send, {a up}
        Sleep, 25
        Send, {d down}
        Sleep, 3200
        Send, {d up}
        Sleep, 25
    }
    return