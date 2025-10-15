extends Control

@onready var anime = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	NetworkManager.connect_to_server()
	anime.play("logo")
	$Timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/login.tscn")
