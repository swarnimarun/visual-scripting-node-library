tool
extends VisualScriptCustomNode

enum TYPES {
	VECTOR2,
	VECTOR3
}

enum MATH {
	ADD,
	MULTIPLY,
	SUBTRACT,
	DIVIDE
}

export(MATH) var math = MATH.MULTIPLY
export(TYPES) var vec = TYPES.VECTOR2

func _get_caption():
	return "Float Vector Math"

func _get_text():
	return ""

func _get_category():
	return "Math"

func _get_input_value_port_count(): 
	return 2

func _get_input_value_port_type(idx): 
	if idx == 0:
		return TYPE_REAL
	else:
		if vec == TYPES.VECTOR2:
			return TYPE_VECTOR2
		return TYPE_VECTOR3

func _get_input_value_port_name(idx):
	if idx == 0:
		return "Float"
	else:
		return "Vector2"
	
func _get_output_value_port_count(): 
	return 1
	
func _get_output_value_port_type(idx): 
	return TYPE_VECTOR2
	
func _get_output_value_port_name(idx): 
	return "Result"

func _has_input_sequence_port(): 
	return true
	
func _get_output_sequence_port_count():
	return 1

func _step(inputs, outputs, start_mode, working_mem):
	if math == MATH.MULTIPLY:
		outputs[0] = inputs[0] * inputs[1]
	if math == MATH.DIVIDE:
		outputs[0] = inputs[1] / inputs[0]
	if math == MATH.ADD:
		if vec == TYPES.VECTOR2:
			outputs[0] = Vector2(inputs[0], inputs[0]) + inputs[1]
		else:
			outputs[0] = Vector3(inputs[0], inputs[0], inputs[0]) + inputs[1]
	if math == MATH.SUBTRACT:
		if vec == TYPES.VECTOR2:
			outputs[0] = inputs[1] - Vector2(inputs[0], inputs[0])
		else:
			outputs[0] = inputs[1] - Vector3(inputs[0], inputs[0], inputs[0])
	return 0