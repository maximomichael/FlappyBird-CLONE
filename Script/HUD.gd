extends CanvasLayer

func _ready():
	updateHUD()
	GameControl.connect("signalUpdateHUD", self, "updateHUD" )

func updateHUD():
	$LabelPoint.text = str(GameControl.points)
