extends CanvasLayer

@onready var healthbar: ProgressBar = $BoxContainer/ProgressBar
@onready var score: Label = $ScoreContainer/Score
@onready var RetryMenu: Control = $"Retry Menu"

func _ready() -> void:
	RetryMenu.visible = false

func _process(delta: float) -> void:
	healthbar.value = GameManager.health
	score.text = "Score:" + str(GameManager.score)
	if GameManager.health == 0:
		RetryMenu.visible = true
	


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
	RetryMenu.visible = false
	GameManager.health = 3
	GameManager.score = 0


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	RetryMenu.visible = false
	GameManager.health = 3
	GameManager.score = 0
