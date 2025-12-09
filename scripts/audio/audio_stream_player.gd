extends AudioStreamPlayer

const level_music = preload("res://assets/music/main_menu.mp3")

func _play_music(music: AudioStream, volume = 0.0) -> void:
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

	
