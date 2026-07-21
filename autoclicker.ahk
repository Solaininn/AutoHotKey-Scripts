; Simple autoclicker using f6 as toggle

toggle := false

F6::{
    global toggle

    toggle := !toggle

    if toggle
        SetTimer(AutoClick, 50)   ; click speed in milliseconds
    else
        SetTimer(AutoClick, 0)     ; Stop the timer
}

AutoClick() {
    Click "Right"
}

Esc::ExitApp
