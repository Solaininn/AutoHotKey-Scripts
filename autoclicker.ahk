; Simple autoclicker using f6 as toggle

toggle := false

F6::{
    global toggle
    toggle := !toggle

    while toggle {
        Click "Right"
        Sleep 50 ; click speed in milliseconds
    }
}

Esc::ExitApp
