extends Area2D

var tile_size = 16
var move_timer = 0
const MOVE_TIMER_START = 0.1

var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}

onready var ray = $RayCast2D
onready var fov = $FOV/CollisionShape2D
onready var tween = $Tween
onready var timer = $Timer

export var speed = 3

func _ready():
	self.position = PlayerVariables.player_position
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size
	timer.set_wait_time(.02)
	timer.connect("timeout", self, "_on_Timer_timeout")

func _process(delta):
	move_timer -= delta
	var event = Input
	if tween.is_active():
		return
	for dir in inputs.keys():
		if ((event.is_action_pressed(dir) and move_timer < 0) or event.is_action_pressed(dir)):
			move_timer = MOVE_TIMER_START
			move(dir)

func _input(event):
	if tween.is_active(): #prevents action while moving
		return
#	if event.is_action_pressed("ui_select"):
#		fov.disabled = false
#	if event.is_action_released("ui_select"):
#		fov.disabled = true
	if event.is_action_pressed("ui_select"):
		fov.disabled = false
		timer.start()
#		_on_Timer_timeout()
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
#	if event.is_action_pressed("ui_end"):
#		PlayerVariables.hitpoints -= 2
#	if event.is_action_pressed("ui_home"):
#		print(PlayerVariables.hitpoints)

func _on_Timer_timeout():
	fov.disabled = true

#func _unhandled_input(event):
#	if tween.is_active():
#		return
#	for dir in inputs.keys():
#		if ((event.is_action(dir) and move_timer < 0) or event.is_action_pressed(dir)):
#			move_timer = MOVE_TIMER_START
#			move(dir)

func move(dir):
#	Line 60 forces player movement regardless of collision
#	position += inputs[dir] * tile_size
	fov.position = inputs[dir] * tile_size
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
#		Line 66 handles old movement in grid without tween
#		position += inputs[dir] * tile_size
		move_tween(dir)

func move_tween(dir):
#	self.position = inputs[dir] * tile_size
	tween.interpolate_property(self, "position", position, position + inputs[dir] * tile_size,
	.55/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
