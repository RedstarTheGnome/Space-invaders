extends Node
var aliens = []
var direction: int = 1

func _ready():
	for alien in get_tree().get_nodes_in_group("aliens"):
		alien.edge_reached.connect(_on_edge_reached)
		aliens.append(alien)

func _on_edge_reached():
	direction *= -1  # Reverse direction for all aliens
	
	aliens = aliens.filter(func(a): return is_instance_valid(a)) #checking for removed aliens, Shortform of relooping array and changing aliens array
	
	for alien in aliens:
		alien.direction = direction
		alien.position.y += 50  # Move down when changing direction
		alien.speed += 50
