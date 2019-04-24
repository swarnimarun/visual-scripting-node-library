tool
extends VisualScriptCustomNode

func _get_input_value_port_count():
	return 1

func _get_input_value_port_name(idx):
	return "rect"

func _get_input_value_port_type(idx):
	return TYPE_RECT2

func _get_output_sequence_port_count():
	return 2

func _get_output_sequence_port_text(idx):
	if idx == 0:
		return "each"
	else:
		return "exit"

func _get_output_value_port_count():
	return 1

func _get_output_port_text(idx):
	return "position"

func _get_output_value_port_type(idx):
	return TYPE_VECTOR2

func _get_output_value_port_name(idx):
	return "position"

func _has_input_sequence_port():
	return true

func _get_text():
	return "for every (position) in (rect)"

func _get_caption():
	return "2D Iterator"

func _get_category():
	return "Math"

func _get_working_memory_size():
	return 1

func _step(inputs, outputs, start_mode, working_mem):
	if start_mode == START_MODE_BEGIN_SEQUENCE:
		if inputs[0].size == Vector2(0, 0):
			return "Can't iterate over area with dimensions 0, 0"
		working_mem[0] = 0
	
	var x = working_mem[0] % int(inputs[0].size.x)
	var y = working_mem[0] / int(inputs[0].size.y)
	var next_pos = Vector2(x, y) + inputs[0].position

	working_mem[0] += 1
	
	# call sequence output 2 (exit) after iterating
	if !inputs[0].has_point(next_pos):
		return 1
	
	outputs[0] = next_pos

	# let this function be called again when everything is done executing
	return 0 | STEP_PUSH_STACK_BIT
