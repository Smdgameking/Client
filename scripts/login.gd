extends Control

@onready var anime = $AnimationPlayer
@onready var pas = $background/form/password
@onready var user = $background/form/username

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$background/form.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $background/popup.visible == true or $background/form.visible == true:
		$background/holder.visible = false
	else:
		$background/holder.visible = true


func _on_email_pressed() -> void:
	$background/form.visible = true


func _on_google_pressed() -> void:
	$background/popup.visible = true
	anime.play("popup")


func _on_facebook_pressed() -> void:
	$background/popup.visible = true
	anime.play("popup")


func _on_confirm_pressed() -> void:
	anime.play("popup_close")
	$background/popup.visible = false


func _on_idha_pressed() -> void:
	pass # Replace with function body.


func _on_login_pressed() -> void:
	var pa = pas.text
	var us = user.text
	NetworkManager.send_login_data(str(us),str(pa))
