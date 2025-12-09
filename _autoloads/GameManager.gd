extends Node

# Enum for different game states
enum GameState {
	MAIN_MENU,
	IN_GAME,
	PAUSED,
	GAME_OVER
}

# Variable to hold the current game state, typed with GameState
var current_game_state: GameState = GameState.MAIN_MENU

# Signal to notify other nodes when the game state changes
signal game_state_changed(new_state: GameState)


# Function to change the game state
func set_game_state(new_state: GameState) -> void:
	current_game_state = new_state
	game_state_changed.emit(new_state)


# Function to change the current scene
func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
