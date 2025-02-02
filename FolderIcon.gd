extends Sprite2D
var last_click_time = 0
var my_computer_node
const DOUBLE_CLICK_TIME = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	my_computer_node = get_parent().get_node("MyComputer")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if get_rect().has_point(to_local(event.position)):
			var current_time = Time.get_ticks_msec()
			if current_time - last_click_time <= DOUBLE_CLICK_TIME:
				print("Double Click detected!")
				my_computer_node.visible = true
				
			last_click_time = current_time
	
