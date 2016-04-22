#IfWinActive StreetFighterV

;-----------
; Variables
;-----------

tEnterMenu := 250 ; Delay to enter in a menu
SetKeyDelay, 25, 25 ; Delay between input in option, used by Send

bNetworkFightRequest := false ; Network Fight Request ON / OFF
bRecordingSlot1 := false ; Recording Slot 1 ON / OFF
bRecordingSlot2 := false ; Recording Slot 2 ON / OFF
bRecordingSlot3 := false ; Recording Slot 3 ON / OFF
bRecordingSlot4 := false ; Recording Slot 4 ON / OFF
bRecordingSlot5 := false ; Recording Slot 5 ON / OFF
bWakeUp1 := false ; Wake-Up Recording Slot 1 ON / OFF
bWakeUp2 := false ; Wake-Up Recording Slot 2 ON / OFF
bWakeUp3 := false ; Wake-Up Recording Slot 3 ON / OFF
bWakeUp4 := false ; Wake-Up Recording Slot 4 ON / OFF
bWakeUp5 := false ; Wake-Up Recording Slot 5 ON / OFF
bGuardRecovery1 := false ; Guard Recovery Recording Slot 1 ON / OFF
bGuardRecovery2 := false ; Guard Recovery Recording Slot 2 ON / OFF
bGuardRecovery3 := false ; Guard Recovery Recording Slot 3 ON / OFF
bGuardRecovery4 := false ; Guard Recovery Recording Slot 4 ON / OFF
bGuardRecovery5 := false ; Guard Recovery Recording Slot 5 ON / OFF


;--------------------------------------------------------------------------------------------
; Binding Config for French Keyboard layout
;
; Those shorcuts are effective when the cursor selector is on 'Restart' in the Training mode
;--------------------------------------------------------------------------------------------

; Restart
Space::
Restart()
KeyWait, Space
Return

; Apply Custom Settings
F6::
ApplyCustomSettings()
KeyWait, F6
Return

; Network Fight Request
F7::
GoNetworkFightRequestSettings(bNetworkFightRequest)
KeyWait, F7
Return


;----------------
; Recording Slot
;----------------

SC002:: ; Recording Slot 1
GoActionRecordingSettings(1)
Return

SC003:: ; Recording Slot 2
GoActionRecordingSettings(2)
Return

SC004:: ; Recording Slot 3
GoActionRecordingSettings(3)
Return

SC005:: ; Recording Slot 4
GoActionRecordingSettings(4)
Return

SC006:: ; Recording Slot 5
GoActionRecordingSettings(5)
Return


;---------------
; Playback Slot
;---------------

F1:: ; Playback Slot 1
GoActionPlaybackSettings(bRecordingSlot1, 1)
KeyWait, F1
Return

F2:: ; Playback Slot 2
GoActionPlaybackSettings(bRecordingSlot2, 2)
KeyWait, F2
Return

F3:: ; Playback Slot 3
GoActionPlaybackSettings(bRecordingSlot3, 3)
KeyWait, F3
Return

F4:: ; Playback Slot 4
GoActionPlaybackSettings(bRecordingSlot4, 4)
KeyWait, F4
Return

F5:: ; Playback Slot 5
GoActionPlaybackSettings(bRecordingSlot5, 5)
KeyWait, F5
Return


;------------------------
; Record Wake-Up Actions
;------------------------

^SC002:: ; Recording Slot 1
GoRecordWakeUpActions(1)
Return

^SC003:: ; Recording Slot 2
GoRecordWakeUpActions(2)
Return

^SC004:: ; Recording Slot 3
GoRecordWakeUpActions(3)
Return

^SC005:: ; Recording Slot 4
GoRecordWakeUpActions(4)
Return

^SC006:: ; Recording Slot 5
GoRecordWakeUpActions(5)
Return


;-------------------------------
; Record Guard Recovery Actions
;-------------------------------

!SC002:: ; Recording Slot 1
GoRecordGuardRecoveryActions(1)
Return

!SC003:: ; Recording Slot 2
GoRecordGuardRecoveryActions(2)
Return

!SC004:: ; Recording Slot 3
GoRecordGuardRecoveryActions(3)
Return

!SC005:: ; Recording Slot 4
GoRecordGuardRecoveryActions(4)
Return

!SC006:: ; Recording Slot 5
GoRecordGuardRecoveryActions(5)
Return


;---------------------
; Set Wake-Up Actions
;---------------------

^F1:: ; Recording Slot 1
GoSetWakeUpActions(bWakeUp1, 1)
KeyWait, F1
Return

^F2:: ; Recording Slot 2
GoSetWakeUpActions(bWakeUp2, 2)
KeyWait, F2
Return

^F3:: ; Recording Slot 3
GoSetWakeUpActions(bWakeUp3, 3)
KeyWait, F3
Return

^F4:: ; Recording Slot 4
GoSetWakeUpActions(bWakeUp4, 4)
KeyWait, F4
Return

^F5:: ; Recording Slot 5
GoSetWakeUpActions(bWakeUp5, 5)
KeyWait, F5
Return


;----------------------------
; Set Guard Recovery Actions
;----------------------------

!F1:: ; Recording Slot 1
GoSetWakeUpActions(bGuardRecovery1, 1)
KeyWait, F1
Return

!F2:: ; Recording Slot 2
GoSetWakeUpActions(bGuardRecovery2, 2)
KeyWait, F2
Return

!F3:: ; Recording Slot 3
GoSetWakeUpActions(bGuardRecovery3, 3)
KeyWait, F3
Return

!F4:: ; Recording Slot 4
GoSetWakeUpActions(bGuardRecovery4, 4)
KeyWait, F4
Return

!F5:: ; Recording Slot 5
GoSetWakeUpActions(bGuardRecovery5, 5)
KeyWait, F5
Return


;-----------
; Functions
;-----------

GoBasicSettings() {
    global tEnterMenu
    Send {enter}
    Sleep tEnterMenu
}

MoveRightSettings() {
    global tEnterMenu
    Send {j}
    Sleep tEnterMenu
}

MoveLeftSettings() {
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
    MoveRightSettings()
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
    MoveLeftSettings()
}

GoNetworkFightRequestSettings(ByRef bNetworkFightRequest) {
    global tEnterMenu
    GoBasicSettings()
    Send {up 3} {b}
    Sleep tEnterMenu
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
    bNetworkFightRequest := !bNetworkFightRequest
    Sleep tEnterMenu
    Send {down 3} {enter}
}

GoActionRecordingSettings(slot) {
    global tEnterMenu
    GoDummySettings(4)
    Send {down} {b}
    Sleep tEnterMenu
    slot := 1 + slot
    Send {down %slot%} {b} ; Recording Slot
    KeyWait, enter, d ; Wait user record
    Sleep tEnterMenu
    Sleep tEnterMenu
    Send {up %slot%} {n}
    Sleep tEnterMenu
    MoveLeftSettings()
    Send {enter}
}

GoActionPlaybackSettings(ByRef bRecordingSlot, slot) {
    global tEnterMenu
    GoDummySettings(4)
    Send {down 2} {b}
    Sleep tEnterMenu
    if (bRecordingSlot) { ; ON -> OFF
        Send {down %slot%} {left} {up %slot%} {n}

    } else { ; OFF -> ON
        Send {down %slot%} {right} {up %slot%} {n}
    }
    bRecordingSlot := !bRecordingSlot
    Sleep tEnterMenu
    MoveLeftSettings()
    Send {enter}
}

; move =
; 6: Wake-Up
; 7: Guard Recovery
GoRecordSpecialActions(slot, move) {
    global tEnterMenu
    GoDummySettings(1)
    Send {down %move%} {b}
    Sleep tEnterMenu
    slot := 1 + slot
    Send {down %slot%} {b} ; Recording Slot
    KeyWait, enter, d ; Wait user record
    Sleep tEnterMenu
    Sleep tEnterMenu
    KeyWait, enter, d ; Wait user record
    Sleep tEnterMenu
    Sleep tEnterMenu
    Send {up %slot%} {n}
    MoveLeftSettings()
    Send {enter}
}

GoRecordWakeUpActions(slot) {
    GoRecordSpecialActions(slot, 6)
}

GoRecordGuardRecoveryActions(slot) {
    GoRecordSpecialActions(slot, 7)
}

GoSetSpecialActions(ByRef bRecordingSlot, slot, move) {
    global tEnterMenu
    GoDummySettings(1)
    Send {down %move%} {b}
    Sleep tEnterMenu
    slot := slot - 1
    Send {down %slot%}
    if (bRecordingSlot) { ; ON -> OFF
        Send {left}
    } else {  ; OFF -> ON
        Send {right}
    }
    bRecordingSlot := !bRecordingSlot
    Send {up %slot%} {n}
    Sleep tEnterMenu
    MoveLeftSettings()
    Send {enter}
}

GoSetWakeUpActions(ByRef bRecordingSlot, slot) {
    GoSetSpecialActions(bRecordingSlot, slot, 8)
}

GoSetGuardRecoveryActions(ByRef bRecordingSlot, slot) {
    GoSetSpecialActions(bRecordingSlot, slot, 9)
}

Restart() {
    GoBasicSettings()
    Send {b}
}

ApplyCustomSettings(){
    global tEnterMenu
    GoBasicSettings()
    Send {down 4} {right} ; Atack Data = ON
    Send {down} {right} ; Key Display = ON
    MoveRightSettings() ; Dummy Settings
    Send {left 3} ; Status = Dummy
    Send {down 2} {left 4} {right 2} ; Guard = After First Attack
    Send {down 3} {left 2} {right 1} ; Stun = No Stun
    MoveLeftSettings() ; Basic Settings
    Sleep tEnterMenu
    Send {enter}
}


Return
