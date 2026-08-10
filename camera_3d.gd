extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_input(true);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(ev):
	if Input.is_key_pressed(KEY_A):
		position.z += 0.1;
	if Input.is_key_pressed(KEY_D):
		position.z -= 0.1;
	if Input.is_key_pressed(KEY_W):
		position.x -= 0.1;
	if Input.is_key_pressed(KEY_S):
		position.x += 0.1;
