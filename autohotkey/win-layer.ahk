#Requires AutoHotkey v2.0

; Disable the caps lock key
SetCapsLockState "AlwaysOff"

; Define alternative keyboard layer here
#HotIf GetKeyState("CapsLock", "P")
	k::Send "{Up}"
	h::Send "{Left}"
	j::Send "{Down}"
	l::Send "{Right}"
#HotIf 