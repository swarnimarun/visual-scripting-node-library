tool
extends VisualScriptCustomNode

enum MoveDirs {
	FOUR,
	EIGHT
}
export var movementDirections = MoveDirs.FOUR

export var toRotate = false

enum Directions{
	Up, # 0
	Down, # 1
	Left, # 2
	Right # 3
}
export var initialDir = Directions.Down


var input = Vector2()
var facing = initialDir
#var myBody = null    # to be used in future


func _get_caption():
	return "TopDown Controller 2D"

func _get_text():
	return ""

func _get_category():
	return "Controller"

func _has_input_sequence_port():
	return true

func _get_output_sequence_port_count():
	return 1

func _get_output_value_port_count():
	return 0

func _get_input_value_port_count():
	return 4

func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	elif idx == 1:
		return TYPE_REAL
	elif idx == 2:
		return TYPE_VECTOR2
	return TYPE_REAL

func _get_input_value_port_name(idx):
	if idx == 0:
		return "Body"
	elif idx == 1:
		return "Speed"
	elif idx == 2:
		return "Input"
	elif idx == 3:
		return "Delta"
	return "Extra"

func _step(inputs, outputs, start_mode, working_mem):
	var body = inputs[0]
	var inp = inputs[2]
	
	if movementDirections == MoveDirs.FOUR:
		if input.x != 0: # this will be modified once strength keys start working with keyboard
			inp.y = 0
		if input.y != 0:
			inp.x = 0
		input = inp
	
	#change rotation
	if toRotate:
		
		pass # to complete
	
	body.move_and_slide(inp * inputs[1] * 200 * inputs[3])
	return 0












