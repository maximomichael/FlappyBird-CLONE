extends RigidBody2D

var loss = false

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("Touch"):
		on_touch()

func on_touch():
	if !loss:
		apply_impulse(Vector2(0, 0), Vector2(0, -800))
		$AudioFly.play()
		$AudioFly.stream.loop = false
	
func _on_AreaPlay2D_area_entered(area):
	loss = true	
	if !$AudioCollision.playing:
		$AudioCollision.play()
		$AudioCollision.stream.loop = false
		
	apply_impulse(Vector2(0, 0), Vector2(-800, -200))
	$CollisionShape2D.disabled = true
	yield(get_tree().create_timer(.7), "timeout")
	get_tree().paused = true
	yield(get_tree().create_timer(.5), "timeout")
	get_tree().paused = false
	GameControl.resetPoint()
	get_tree().reload_current_scene()
	

func _on_AreaVerifyPoint_area_entered(area):
	if !loss:
		GameControl.newPoint()
		if !$AudioScore.playing:
			$AudioScore.play()
			$AudioScore.stream.loop = false
