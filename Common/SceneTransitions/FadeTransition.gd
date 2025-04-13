extends Node2D
@onready var colour_rect = $ColorRect
@onready var animation_player = $AnimationPlayer
signal transition_complete

func _ready() -> void:
	colour_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_out":
		animation_player.play("fade_in")
		transition_complete.emit()
	elif anim_name == "fade_in":
		colour_rect.visible = false
	
func transition() -> void:
	colour_rect.visible = true
	animation_player.play("fade_out")
