extends Node

enum GameState {
	MAIN_MENU,
	IN_GAME,
	PAUSED,
	GAME_OVER
}

var current_game_state: GameState = GameState.MAIN_MENU

signal game_state_changed(new_state: GameState)


func set_game_state(new_state: GameState) -> void:
	current_game_state = new_state
	game_state_changed.emit(new_state)


func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
