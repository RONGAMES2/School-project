extends Label

func _ready() -> void:
	text = "High Score: " + str(GameManager.highest_record)

func _process(delta: float) -> void:
	if GameManager.score > GameManager.highest_record:
		GameManager.highest_record = GameManager.score
		text = "High Score: " + str(GameManager.score)
		GameManager.save_score()
