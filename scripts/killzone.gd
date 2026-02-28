extends Area2D

@onready var player = %Player

@onready var timer: Timer = $Timer

func _on_body_entered(body) -> void:
	body.die()
	print("You died :(")
	get_tree().reload_current_scene()
