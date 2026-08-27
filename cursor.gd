extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN;
	
	var stereoXFactor = 1;
	var stereoYFactor = 1;
	
	if $"../../../../../..".enableStereoscopy:
		if $"../../../../../..".topAndBottom:
			stereoYFactor = 0.5
		else:
			stereoXFactor = 0.5
	
	# since i'm splitting the screen in half i need to compensate by making the mouse travel double
	position.x = get_global_mouse_position().x * stereoXFactor;
	position.y = get_global_mouse_position().y * stereoYFactor;
	
	pass
