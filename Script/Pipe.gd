extends Node2D

export var velocity = -150

func _ready():
	pass # Replace with function body.

func _process(delta):
	translate(Vector2(1,0) * velocity * delta)
	
	if transform.origin.x < - 250:
		queue_free()
