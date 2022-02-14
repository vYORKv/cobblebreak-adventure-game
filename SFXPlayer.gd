extends Node

onready var apple = load("res://Assets/Audio/SFX/AppleInter.wav")
onready var sword = load("res://Assets/Audio/SFX/SwordInter.wav")
onready var dead_tree = load("res://Assets/Audio/SFX/DeadTreeInter.wav")
onready var rope = load("res://Assets/Audio/SFX/RopeInter.wav")
onready var doors = load("res://Assets/Audio/SFX/DoorInter.wav")
onready var stairs = load("res://Assets/Audio/SFX/Footsteps.wav")
onready var teleport = load("res://Assets/Audio/SFX/Teleport.wav")
onready var skele = load("res://Assets/Audio/SFX/SkeleInter.wav")
onready var necro_tele = load("res://Assets/Audio/SFX/NecroTele.wav")

func _ready():
	pass

func apple():
	$SFX.stream = apple
	$SFX.play()

func sword():
	$SFX.stream = sword
	$SFX.play()

func dead_tree():
	$SFX.stream = dead_tree
	$SFX.play()

func rope():
	$SFX.stream = rope
	$SFX.play()

func doors():
	$SFX.stream = doors
	$SFX.play()

func stairs():
	$SFX.stream = stairs
	$SFX.play()

func teleport():
	$SFX.stream = teleport
	$SFX.play()

func skele():
	$SFX.stream = skele
	$SFX.play()

func necro_tele():
	$SFX.stream = necro_tele
	$SFX.play()
