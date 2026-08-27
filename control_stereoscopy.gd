extends Node

@export var enableStereoscopy = true;
@export var setIPD = 0.06;
@export var swapEyes = false;
@export var topAndBottom = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#garbage collection
	for idx in $Control/SubViewportContainer2/SubViewport.get_children():
		idx.free();
	for idx in $Control/SubViewportContainer3/SubViewport.get_children():
		idx.free();
	
	if enableStereoscopy:
		
		if topAndBottom:
			
			var Node3D2 = $Control/SubViewportContainer/SubViewport/Node3D.duplicate();
			$Control/SubViewportContainer3/SubViewport.add_child(Node3D2);
			
			if swapEyes:
				$Control/SubViewportContainer/SubViewport/Node3D/Camera3D.h_offset = setIPD;
				$Control/SubViewportContainer3/SubViewport/Node3D/Camera3D.h_offset = 0-setIPD;
			else:
				$Control/SubViewportContainer/SubViewport/Node3D/Camera3D.h_offset = 0-setIPD;
				$Control/SubViewportContainer3/SubViewport/Node3D/Camera3D.h_offset = setIPD;
				
			self.scale = Vector2(1, 0.5);
			
		else:
			
			var Node3D2 = $Control/SubViewportContainer/SubViewport/Node3D.duplicate();
			$Control/SubViewportContainer2/SubViewport.add_child(Node3D2);
			
			if swapEyes:
				$Control/SubViewportContainer/SubViewport/Node3D/Camera3D.h_offset = setIPD;
				$Control/SubViewportContainer2/SubViewport/Node3D/Camera3D.h_offset = 0-setIPD;
			else:
				$Control/SubViewportContainer/SubViewport/Node3D/Camera3D.h_offset = 0-setIPD;
				$Control/SubViewportContainer2/SubViewport/Node3D/Camera3D.h_offset = setIPD;
			
			self.scale = Vector2(0.5, 1);
		
	else:
		
		$Control/SubViewportContainer/SubViewport/Node3D/Camera3D.h_offset = 0;
		
		self.scale = Vector2(1, 1);
