#IfWinActive StreetFighterV

;
; Variables
;

tInput := 22 ; Delay between move input in game, used by SendInput
tEnterMenu := 250 ; Delay to enter in a menu
SetKeyDelay, 25, 25 ; Delay between input in option, used by Send

bNetworkFightRequest := false ; Network Fight Request ON / OFF
bRecordingSlot1 := false ; Recording Slot 1 ON / OFF
bRecordingSlot2 := false ; Recording Slot 2 ON / OFF
bRecordingSlot3 := false ; Recording Slot 3 ON / OFF
bRecordingSlot4 := false ; Recording Slot 4 ON / OFF
bRecordingSlot5 := false ; Recording Slot 5 ON / OFF


;
; Binding Moves for French Keyboard layout
;

z::w ; Up
s::s ; Down
q::a ; Left
d::d ; Right

u::n ; LP
i::g ; MP
o::h ; HP
p::k ; LP+MP+HP

j::b ; LK
k::, ; MK
l::m ; HK
m::j ; LK+MK+HK

;***:: ; Throw
;SendInput {n down} {b down}
;KeyWait, ***
;SendInput {n up} {b up}
;Return

;***::  ; V-Skill
;SendInput {h down}{n down}
;KeyWait, ***
;SendInput {h up}{n up}
;Return

;***:: ; V-Trigger
;SendInput {j down} {m down}
;KeyWait, ***
;SendInput {j up} {m up}
;Return

a:: ; 360 + LP
SPDFromLeft(tInput)
KeyWait, a
Return

z:: ; 720 + LP
CAFromLeft(tInput)
KeyWait, z
Return


;
; Combos
;

w::
SendInput {left down} {h down}
Sleep tInput
SendInput {left up} {h up}
CAFromLeft(tInput)
KeyWait, w
Return


;
; Binding Config
;

; The cursor selector should always be on Restart in  the Training mode

Space:: ; Restart
GoBasicSettings()
Send {b}
KeyWait, Space
Return

F6:: ; Apply Custom Settings
GoBasicSettings()
Send {down 4} {right} ; Atack Data = ON
Send {down} {right} ; Key Display = ON
GoRightSettings() ; Dummy Settings
Send {left 3} ; Status = Dummy
Send {down 2} {left 4} {right 2} ; Guard = After First Attack
Send {down 3} {left 2} {right 1} ; Stun = No Stun
GoLeftSettings() ; Basic Settings
Sleep tEnterMenu
Send {enter}
KeyWait, F6
Return

F7:: ; Network Fight Request
GoNetworkFightRequestSettings()
if (bNetworkFightRequest) { ; ON -> OFF
    Send {right} ; Ranked Match = OFF
    Send {down} {right} ; Casual Match = OFF
    Send {up 2} {b}

} else { ; OFF -> ON
    Send {left} ; Ranked Match = ON
    Send {down 3} {right 4} {left 2} ; Connection Status = 4-5
    Send {down} {left} ; Battle Confirmation = Ask
    Send {down 2} {b}
}
Sleep tEnterMenu
Send {down 3} {enter}
bNetworkFightRequest := !bNetworkFightRequest
KeyWait, F7
Return

SC002:: ; Recording Slot 1
GoActionRecordingSettings()
Send {down 2} {b} ; Recording Slot 1
KeyWait, enter, d ; Wait user record
Sleep tEnterMenu
Sleep tEnterMenu
Send {up 2} {n}
Sleep tEnterMenu
Send {k} {enter}
Return

SC003:: ; Recording Slot 2
GoActionRecordingSettings()
Send {down 3} {b} ; Recording Slot 2
KeyWait, enter, d ; Wait user record
Sleep tEnterMenu
Sleep tEnterMenu
Send {up 3} {n}
Sleep tEnterMenu
Send {k} {enter}
Return

SC004:: ; Recording Slot 3
GoActionRecordingSettings()
Send {down 4} {b} ; Recording Slot 3
KeyWait, enter, d ; Wait user record
Sleep tEnterMenu
Sleep tEnterMenu
Send {up 4} {n}
Sleep tEnterMenu
Send {k} {enter}
Return

SC005:: ; Recording Slot 4
GoActionRecordingSettings()
Send {down 5} {b} ; Recording Slot 4
KeyWait, enter, d ; Wait user record
Sleep tEnterMenu
Sleep tEnterMenu
Send {up 5} {n}
Sleep tEnterMenu
Send {k} {enter}
Return

SC006:: ; Recording Slot 5
GoActionRecordingSettings()
Send {down 6} {b} ; Recording Slot 5
KeyWait, enter, d ; Wait user record
Sleep tEnterMenu
Sleep tEnterMenu
Send {up 6} {n}
Sleep tEnterMenu
Send {k} {enter}
Return

F1:: ; Playback Slot 1
GoActionPlaybackSettings()
if (bRecordingSlot1) { ; ON -> OFF
    Send {down} {left} {up} {n}

} else { ; OFF -> ON
    Send {down} {right} {up} {n}
}
OutActionPlaybackSettings(bRecordingSlot1)
KeyWait, F1
Return

F2:: ; Playback Slot 2
GoActionPlaybackSettings()
if (bRecordingSlot2) { ; ON -> OFF
    Send {down 2} {left} {up 2} {n}

} else { ; OFF -> ON
    Send {down 2} {right} {up 2} {n}
}
OutActionPlaybackSettings(bRecordingSlot2)
KeyWait, F2
Return

F3:: ; Playback Slot 3
GoActionPlaybackSettings()
if (bRecordingSlot3) { ; ON -> OFF
    Send {down 3} {left} {up 3} {n}

} else { ; OFF -> ON
    Send {down 3} {right} {up 3} {n}
}
OutActionPlaybackSettings(bRecordingSlot3)
KeyWait, F3
Return

F4:: ; Playback Slot 4
GoActionPlaybackSettings()
if (bRecordingSlot4) { ; ON -> OFF
    Send {down 4} {left} {up 4} {n}

} else { ; OFF -> ON
    Send {down 4} {right} {up 4} {n}
}
OutActionPlaybackSettings(bRecordingSlot4)
KeyWait, F4
Return

F5:: ; Playback Slot 5
GoActionPlaybackSettings()
if (bRecordingSlot5) { ; ON -> OFF
    Send {down 5} {left} {up 5} {n}

} else { ; OFF -> ON
    Send {down 5} {right} {up 5} {n}
}
OutActionPlaybackSettings(bRecordingSlot5)
KeyWait, F5
Return

;
; Moves
;

; Left SPD + LP
; left, left-down, down, down-right, right, right-up + P
SPDFromLeft(tInput) {
    SendInput {left down}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {left up}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down} {n down}
    Sleep tInput
    SendInput {up up} {right up} {n up}
}

; Right SPD + LP
; right, right-down, down, down-left, left, left-up + P
SPDFromRight(tInput) {
    SendInput {R1 down}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {R1 up}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down} {n down}
    Sleep tInput
    SendInput {up up} {left up} {n up}
}

; Left CA + LP
; left, left-down, down, down-right, right, right-up, up, up-left, left, left-down, down, down-right, right + P
CAFromLeft(tInput) {
    SendInput {left down}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {left up}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down}
    Sleep tInput
    SendInput {right up}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {up up}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {left up}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {down up} {n down}
    Sleep tInput
    SendInput {right up} {n up}
}

; Right CA + LP
; right, right-down, down, down-left, left, left-up, up, up-right, right, right-down, down, down-left, left + P
CAFromRight(tInput) {
    SendInput {right down}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {right up}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down}
    Sleep tInput
    SendInput {left up}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {up up}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {right up}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {down up} {n down}
    Sleep tInput
    SendInput {left up} {n up}
}

; Down CA + LP (anticlockwise)
; down, down-right, right, right-up, up, up-left, left, left-down, down, down-right, right, up-right, up + P
CAFromDownToRight(tInput) {
    SendInput {down down}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down}
    Sleep tInput
    SendInput {right up}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {up up}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {left up}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down}
    Sleep tInput
    SendInput {right up} {n down}
    Sleep tInput
    SendInput {up up} {n up}
}

; Down CA + LP (clockwise)
; down, down-left, left, left-up, up, up-right, right, right-down, down, down-left, left, up-left, up + P
CAFromDownToLeft(tInput) {
    SendInput {down down}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down}
    Sleep tInput
    SendInput {left up}
    Sleep tInput
    SendInput {right down}
    Sleep tInput
    SendInput {up up}
    Sleep tInput
    SendInput {down down}
    Sleep tInput
    SendInput {right up}
    Sleep tInput
    SendInput {left down}
    Sleep tInput
    SendInput {down up}
    Sleep tInput
    SendInput {up down}
    Sleep tInput
    SendInput {left up} {n down}
    Sleep tInput
    SendInput {up up} {n up}
}

GoBasicSettings() {
    global tEnterMenu
    Send {enter}
    Sleep tEnterMenu
}

GoRightSettings() {
    global tEnterMenu
    Send {j}
    Sleep tEnterMenu
}

GoLeftSettings() {
    global tEnterMenu
    Send {k}
    Sleep tEnterMenu
}

; 0: Status = No change
; 1: Status = Dummy
; 2: Status = CPU
; 3: Status = Player Controlled
; 4: Status = Playback Recording
GoDummySettings(mode) {
    GoBasicSettings()
    Send {j}
    Sleep tEnterMenu ; Dummy Settings
    if (mode = 4) {
        Send {right 3} ; Status = Playback Recording
    } else if (mode <> 0) {
        Send {left 3}
        if (mode = 2) {
            Send {right 1} ; Status = CPU
        } else if (mode = 3) {
            Send {right 2} ; Status = Player Controlled
        } ; else Status = Dummy
    } ; else Status = No change
}

GoGaugeSettings() {
    GoBasicSettings()
    GoLeftSettings()
}

GoNetworkFightRequestSettings() {
    global tEnterMenu
    GoBasicSettings()
    Send {up 3} {b}
    Sleep tEnterMenu
}

GoActionRecordingSettings() {
    global tEnterMenu
    GoDummySettings(4)
    Send {down} {b}
    Sleep tEnterMenu
}

GoActionPlaybackSettings() {
    global tEnterMenu
    GoDummySettings(4)
    Send {down 2} {b}
    Sleep tEnterMenu
}

OutActionPlaybackSettings(ByRef bRecordingSlot) {
    global tEnterMenu
    Sleep tEnterMenu
    Send {k} {enter}
    bRecordingSlot := !bRecordingSlot
}

Return
