#IfWinActive StreetFighterV

;-----------
; Variables
;-----------

tInput := 22 ; Delay between move input in game, used by SendInput


;--------------
; Move binding
;--------------

a:: ; 360 + LP
SPDFromLeft(tInput)
KeyWait, a
Return

z:: ; 720 + LP
CAFromLeft(tInput)
KeyWait, z
Return


;----------------
; Combos binding
;----------------

w::
SendInput {left down} {h down}
Sleep tInput
SendInput {left up} {h up}
CAFromLeft(tInput)
KeyWait, w
Return


;-------
; Moves
;-------

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


Return
