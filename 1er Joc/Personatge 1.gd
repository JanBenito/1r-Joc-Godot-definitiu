extends KinematicBody2D

var direccio = 1
var velocitat = Vector2()
var gravetat = 3000.0
var esta_atacant = false

func _physics_process(delta):
	if Input.is_action_just_pressed("amunt1"):
		if is_on_floor():
			velocitat.y = - 1200
	if Input.is_action_pressed("dreta1"):
		direccio = 1
		velocitat.x = 300 * direccio
	elif Input.is_action_pressed("esquerra1"):
		direccio = -1
		velocitat.x = 300 * direccio
	else:
		velocitat.x = 0
	velocitat.y += gravetat * delta
	velocitat = move_and_slide(velocitat,Vector2.UP)
	if Input.is_action_pressed("atac"):
		esta_atacant = true
		$AnimatedSprite.play("Atac")
	
		

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Atac":
		esta_atacant = false
		$AnimatedSprite.play("Quiet")
