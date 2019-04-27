tool
extends VisualScriptCustomNode

func _get_caption():
	return "Get Mouse Position"

func _get_category():
	return "Input"

func _get_text():
	return ""

func _get_input_value_port_count():
	return 1

func _get_input_value_port_name(idx):
	return "Base"

func _get_input_value_port_type(idx):
	return TYPE_OBJECT

func _get_output_value_port_count():
	return 1

func _get_output_value_port_name(idx):
	return "position"

func _get_output_value_port_type(idx):
	return TYPE_VECTOR2

func _step(inputs, outputs, start_mode, working_mem):
	if not inputs[0] or !inputs[0] is CanvasItem:
		return "Object isn't of type CanvasItem"
	outputs[0] = inputs[0].get_viewport().get_mouse_position()
	return 0