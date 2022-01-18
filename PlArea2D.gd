extends Area2D

func _physics_process(delta):
	var boddies = get_overlapping_bodies()
	for body in boddies:
		if body.name == "Enemy_0" or body.name == "Enemy_1":
			get_parent().queue_free()