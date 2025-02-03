extends Sprite2D
var last_click_time = 0
const DOUBLE_CLICK_TIME = 300

var is_dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

var my_computer_node



# Called when the node enters the scene tree for the first time.
func _ready():
	my_computer_node = get_parent().get_node("MyComputer")
	set_process_input(true)# Replace with function body.


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
				event.pressed = false
				
			last_click_time = current_time
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and is_mouse_over():
				is_dragging = true
				drag_offset = global_position - event.position
			elif not event.pressed:
				is_dragging = false

	# Update position while dragging
	if event is InputEventMouseMotion and is_dragging:
		global_position = event.position + drag_offset
		
	
func is_mouse_over() -> bool:
	var mouse_pos = get_viewport().get_mouse_position()
	var sprite_rect = Rect2(
		global_position - (texture.get_size() * 0.5),
		texture.get_size()
	)
	return sprite_rect.has_point(mouse_pos)
