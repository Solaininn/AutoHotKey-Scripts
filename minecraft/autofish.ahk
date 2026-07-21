#SingleInstance Force

toggle := false

; --------------------------
; Set these to the bobber's screen position.
; - Stand in one spot and dont move
; - Throw bobber into water
; - Use Window Spy (included with ahk) to set it.
; - Hover over center of the bobber and write down the cords

bobberX := 960
bobberY := 540

; Size of monitored area
radius := 12

; Difference before a splash is registered
threshold := 35

; Delay after reeling before recasting
recastDelay := 700
; --------------------------

baseline := []

F6::{
    global toggle, baseline

    toggle := !toggle

    if toggle {
        ToolTip "Autofishing ON"

        ; Cast rod
        Click "Right"
        Sleep 1200

        baseline := CaptureRegion()

        while toggle {

            current := CaptureRegion()

            if RegionDifference(baseline, current) > threshold {

                ; Reel in
                Click "Right"

                Sleep 300

                ; Cast again
                Click "Right"

                Sleep recastDelay

                baseline := CaptureRegion()
            }

            Sleep 20
        }

        ToolTip
    } else {
        ToolTip "Autofishing OFF"
        Sleep 1000
        ToolTip
    }
}

CaptureRegion() {
    global bobberX, bobberY, radius

    arr := []

    Loop radius * 2 + 1 {
        y := bobberY - radius + A_Index - 1

        Loop radius * 2 + 1 {

            x := bobberX - radius + A_Index - 1

            color := PixelGetColor(x, y)

            r := (color >> 16) & 255
            g := (color >> 8) & 255
            b := color & 255

            arr.Push((r + g + b) // 3)
        }
    }

    return arr
}

RegionDifference(a, b) {

    total := 0

    Loop a.Length
        total += Abs(a[A_Index] - b[A_Index])

    return total / a.Length
}

Esc::ExitApp