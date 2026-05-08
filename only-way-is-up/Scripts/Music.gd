extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playing = true
	

func _process(delta: float) -> void:
	if GameManager.score == 0:
		stream.set_sync_stream_volume(0, 0)
		stream.set_sync_stream_volume(1, -60)
		stream.set_sync_stream_volume(2, -60)
		stream.set_sync_stream_volume(3, -60)
		stream.set_sync_stream_volume(4, -60)
	if GameManager.score == 1000:
		stream.set_sync_stream_volume(0, lerp(0, -60, -0.1))
		stream.set_sync_stream_volume(1, lerp(-60, 0, 0.1))
		stream.set_sync_stream_volume(2, -60)
		stream.set_sync_stream_volume(3, -60)
		stream.set_sync_stream_volume(4, -60)
