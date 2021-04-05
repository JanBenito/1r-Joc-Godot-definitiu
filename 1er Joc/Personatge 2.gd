extends KinematicBody2D


var vida = 500


func _on_Area2D_area_entered(area):
	vida -= 50
	
func _process(delta):
	$TextureProgress.value = vida
