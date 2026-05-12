extends Node

#enemies
signal enemydeath

#player movement
var can_launch = true

var player_pos: Vector2

#health
@onready var hitCooldown: Timer = $HitTimer
@export var hurt_sfx: AudioStreamPlayer2D

signal playerdamage
signal playerheal

var health: int = 3
var damage: int = 1
var heal: int = 1
var can_be_hit = true
var took_damage = false

#Scoring
var score: int = 0

func update_health():
	if can_be_hit == true and took_damage == true:
		can_be_hit = false
		hitCooldown.start()
		health -= damage
		print("Player took damage!")
	else:
		health += heal
		print("Player healed.")

func _on_hit_timer_timeout() -> void:
	can_be_hit = true
	took_damage = false

func _on_playerdamage() -> void:
	print("Player took damage!")
	took_damage = true
	update_health()
	hurt_sfx.play()


func _on_playerheal() -> void:
	update_health()
