#IfWinActive StreetFighterV

;------------------------------------------
; Binding Moves for French Keyboard layout
;------------------------------------------

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

Return
