extends Node

@export var mob_scene: PackedScene
@export var csv_file_path: String = "C:/Users/gameuser/Desktop/Game Analytics/GA_2026_Emily_Stephen/game_results.csv"
  # Export for easy path changes
var score

func _ready():
	# Create CSV file with headers if it doesn't exist
	if not FileAccess.file_exists(csv_file_path):
		var file = FileAccess.open(csv_file_path, FileAccess.WRITE)
		if file:
			file.store_line("player_speed,score")
			file.close()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	save_results_to_csv()
	
func save_results_to_csv():
	var file = FileAccess.open(csv_file_path, FileAccess.READ_WRITE)
	if file:
		file.seek_end()  # Go to end of file to append
		var player_speed = $Player.speed
		file.store_line(str(player_speed) + "," + str(score))
		file.close()
		print("Results saved: Speed = ", player_speed, ", Score = ", score)
	else:
		print("Error: Could not open CSV file for writing")


func new_game():
	get_tree().call_group(&"mobs", &"queue_free")
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()


func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node(^"MobPath/MobSpawnLocation")
	mob_spawn_location.progress = randi()

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(200.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
