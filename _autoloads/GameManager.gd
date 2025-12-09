## Verwaltet den globalen Spielzustand und Szenenwechsel.
## Als Autoload-Singleton ist es von überall im Projekt
## über den globalen Namen "GameManager" zugänglich.
extends Node

# Enum (Aufzählung) für die verschiedenen Spielzustände.
# Dies hilft, den Spielfluss zu organisieren (z.B. Hauptmenü, im Spiel, pausiert).
enum GameState {
	MAIN_MENU,
	IN_GAME,
	PAUSED,
	GAME_OVER
}

# Speichert den aktuellen Zustand des Spiels.
# Startet standardmäßig im Hauptmenü.
var current_game_state: GameState = GameState.MAIN_MENU

# Signal, das ausgesendet wird, wenn sich der Spielzustand ändert.
# Andere Teile des Spiels (Nodes) können darauf hören und reagieren.
signal game_state_changed(new_state: GameState)


## Setzt einen neuen Spielzustand und benachrichtigt andere Nodes über das Signal.
## @param new_state: Der neue Zustand, der gesetzt werden soll (aus dem GameState Enum).
func set_game_state(new_state: GameState) -> void:
	current_game_state = new_state
	game_state_changed.emit(new_state)


## Wechselt die aktuell laufende Szene.
## Dies entlädt die aktuelle Szene und lädt die neue.
## @param scene_path: Der Pfad zur Szenen-Datei (z.B. "res://scenes/level_1.tscn").
func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
