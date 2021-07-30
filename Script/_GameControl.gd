extends Node

var points = 0

signal signalUpdateHUD()

func newPoint():
	points += 1
	emit_signal("signalUpdateHUD")	
	
func resetPoint():
	points = 0
	emit_signal("signalUpdateHUD")
	
