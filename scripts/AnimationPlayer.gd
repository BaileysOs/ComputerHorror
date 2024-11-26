extends AnimationPlayer

@onready var audio_player = $AudioStreamPlayer

func _input(event: InputEvent) -> void:
	if event.is_pressed():
		seek(current_animation_length, true)
		audio_player.seek(current_animation_length)
		


func _ready():
	play("EchoOsBoot")
	
