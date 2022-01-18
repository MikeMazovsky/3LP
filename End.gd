extends Area2D

func _physics_process(delta):
	var boddies = get_overlapping_bodies()
	for body in boddies:
		if body.name == "Player":
			get_tree().quit()