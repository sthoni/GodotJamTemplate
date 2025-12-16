extends Node

@onready var sfx_pool_1: AudioStreamPlayer = $SFXPool1
@onready var sfx_pool_2: AudioStreamPlayer = $SFXPool2
@onready var sfx_pool_3: AudioStreamPlayer = $SFXPool3
@onready var sfx_pool_4: AudioStreamPlayer = $SFXPool4
@onready var sfx_pool_5: AudioStreamPlayer = $SFXPool5
@onready var sfx_pool: Array[AudioStreamPlayer] = [$SFXPool1, $SFXPool2, $SFXPool3, $SFXPool4, $SFXPool5]

func play_sfx(stream: AudioStream, pitch_randomness: float) -> void:
	var sfx_player: AudioStreamPlayer = sfx_pool.pick_random()
	sfx_player.stream = stream
	sfx_player.pitch_scale = 1.0 + pitch_randomness * (randf() - 0.5)
	sfx_player.play()
