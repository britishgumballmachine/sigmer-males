extends Area2D

@onready var player = %Player

func _process(delta: float) -> void:
	print(player.transform)

@onready var timer: Timer = $Timer

func _on_body_entered(body) -> void:
	body.play("die")
	print("You died :(")
	get_tree().reload_current_scene()
	
