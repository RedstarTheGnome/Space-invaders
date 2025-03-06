extends CharacterBody2D
var bullet = preload("res://lazer.tscn")

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement()
	move_and_slide()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	
func shoot():
	var shot = bullet.instantiate()
	shot.position = position
	get_tree().get_root().add_child(shot)
	
func movement():
	var direction = Input.get_vector("left", "right","ui_down","ui_up")
	velocity = direction * speed
	
