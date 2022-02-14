extends Node

func _ready():
	OS.window_fullscreen = true
	get_tree().change_scene("res://MainMenu.tscn")
	MusicPlayer.play_menu()
