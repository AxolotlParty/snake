extends Node2D

func _on_play_button_pressed() -> void:
	FadeTransition.transition()
	await FadeTransition.transition_complete
	get_tree().change_scene_to_file("res://Stages/Play/PlayStage.tscn")
	pass


func _on_hi_score_button_pressed() -> void:
	# Fade Transition
	# Show the new scene
	pass


func _on_exit_button_pressed() -> void:
	get_tree().quit()
