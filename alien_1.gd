extends Node2D
signal edge_reached


var bullet = preload("res://Alien_lazer.tscn")

var direction = 1
@export var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x +=  direction *speed * delta
	var randNum = randf()
	if randNum >= 0.99:
		shoot()
	
	
	



#Detects shots
func _on_area_2d_area_entered(area: Area2D) -> void:
	if not area.is_in_group("mob"):
		queue_free()

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	edge_reached.emit()


func shoot():
	var shot = bullet.instantiate()
	shot.position = position
	get_tree().get_root().add_child(shot)
