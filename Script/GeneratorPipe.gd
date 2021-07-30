extends Position2D
	
onready var PIPE = preload("res://Scenes/Pipe.tscn")
export(NodePath) var container

func _ready():
	randomize()

func _on_Timer_timeout():
	var newPipe = PIPE.instance()
	newPipe.global_transform.origin = global_transform.origin + Vector2(0, rand_range(-500, 500))
	get_node(container).add_child(newPipe)
