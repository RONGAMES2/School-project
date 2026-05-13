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
signal playerdeath

var health: int = 3
var damage: int = 1
var heal: int = 1
var can_be_hit = true
var took_damage = false

#Scoring
var score: int = 0

# High Scoring
const SAVEFILE = "user://savefile.save"

var highest_record = 0


func _ready() -> void:
	load_score()

func save_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(highest_record)

func load_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		highest_record = file.get_32()

func _process(delta: float) -> void:
	if health <= 0:
		playerdeath.emit()

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
