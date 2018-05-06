tool
extends VisualScriptCustomNode

func _get_caption():
	return "GetInputDirection2D"

func _get_category():
	return "Input"
	
func _get_text():
	return "Input"
	
func _get_input_value_port_count():
	return 0
	
func _get_output_value_port_count():
	return 1
	
func _get_output_value_port_type(idx):
	return TYPE_VECTOR2
	
func _get_output_value_port_name(idx):
	return "Direction"

func _has_input_sequence_port():
	return true
	
func _get_output_sequence_port_count():
	return 1
	
func _step(inputs, outputs, start_mode, working_mem):
	var x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	outputs[0] = Vector2(x,y)
	return 0
	