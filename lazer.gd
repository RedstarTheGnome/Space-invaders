extends Area2D

var speed = 1000
var velocity = Vector2(0, speed)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initial velocity is already set, so no need to change it here
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("boundry"):
		queue_free()
		print("boundry removed lazer")
	#queue_free()
	print("lazer removed")
