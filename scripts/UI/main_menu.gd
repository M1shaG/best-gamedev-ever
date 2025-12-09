extends CanvasLayer

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay/Game.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
