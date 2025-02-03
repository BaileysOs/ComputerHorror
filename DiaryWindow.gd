extends Window


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("close_requested", Callable(self, "on_close_requested"))# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_close_requested():
	hide()
	
