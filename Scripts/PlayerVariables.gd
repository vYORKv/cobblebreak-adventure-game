extends Node

var player_position = Vector2(-16, -16)
var has_key = false
var has_rope = false
var has_apple = false
var has_sword = false
var has_reward = false
var killed_skeleton = false
var cleared_crypt = false
var grave_spoken = 0
var shop_spoken = 0
var sis_spoken = 0
var kid_spoken = 0
var mayor_spoken = 0
var necro_spoken = 0
var me_spoken = 0

func reset():
	player_position = Vector2(-16, -16)
	has_key = false
	has_rope = false
	has_apple = false
	has_sword = false
	has_reward = false
	killed_skeleton = false
	cleared_crypt = false
	grave_spoken = 0
	shop_spoken = 0
	sis_spoken = 0
	kid_spoken = 0
	mayor_spoken = 0
	necro_spoken = 0
	me_spoken = 0
