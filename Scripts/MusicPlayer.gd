extends Node

var menu_music = load("res://Assets/Audio/Music/MainMenu.ogg")
var world_music = load("res://Assets/Audio/Music/World.ogg")
var crypt_music = load("res://Assets/Audio/Music/Catacombs.ogg")
var crypt_cleared = load("res://Assets/Audio/Music/ClearedCrypt.ogg")

func _ready():
	PlayerVariables.reset()

func play_menu():
	$Music.stream = menu_music
	$Music.play()

func play_world():
	$Music.stream = world_music
	$Music.play()

func play_crypt():
	if PlayerVariables.cleared_crypt == false:
		$Music.stream = crypt_music
		$Music.play()
	else:
		$Music.stream = crypt_cleared
		$Music.play()

func stop_music():
	$Music.stop()
