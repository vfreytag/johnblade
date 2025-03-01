extends TextureProgressBar

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	self.get_parent().value = Global.jhealth
