extends Sprite2D
var last_click_time = 0
const DOUBLE_CLICK_TIME = 300
var diary_window_node
# Called when the node enters the scene tree for the first time.
func _ready():
	diary_window_node = get_node("DiaryWindow")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if get_rect().has_point(to_local(event.position)):
			var current_time = Time.get_ticks_msec()
			if current_time - last_click_time <= DOUBLE_CLICK_TIME:
				print("Double Click detected!")
				diary_window_node.visible = true
				
			last_click_time = current_time
