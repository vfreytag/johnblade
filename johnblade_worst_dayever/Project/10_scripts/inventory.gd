extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$CanvasLayer/TextureRect/Label.set_text(str(Global.inv_meat))
	$CanvasLayer/TextureRect/Label2.set_text(str(Global.inv_choc))
	$CanvasLayer/TextureRect/Label3.set_text(str(Global.inv_coff))
	$CanvasLayer/TextureRect/Label4.set_text(str(Global.inv_cig))
	
	if Global.inv_meat == 0:
		$CanvasLayer/TextureRect/TextureRect3.set_modulate(Color(1,1,1,0.3))
	else:
		$CanvasLayer/TextureRect/TextureRect3.set_modulate(Color(1,1,1,1))
		
	if Global.inv_choc == 0:
		$CanvasLayer/TextureRect/TextureRect2.set_modulate(Color(1,1,1,0.3))
	else:
		$CanvasLayer/TextureRect/TextureRect2.set_modulate(Color(1,1,1,1))
	if Global.inv_coff == 0:
		$CanvasLayer/TextureRect/TextureRect4.set_modulate(Color(1,1,1,0.3))
	else:
		$CanvasLayer/TextureRect/TextureRect4.set_modulate(Color(1,1,1,1))
	if Global.inv_cig == 0:
		$CanvasLayer/TextureRect/TextureRect.set_modulate(Color(1,1,1,0.3))
	else:
		$CanvasLayer/TextureRect/TextureRect.set_modulate(Color(1,1,1,1))
