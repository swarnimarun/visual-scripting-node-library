tool
extends VisualScriptCustomNode

func _get_caption():
	return "Access Global Variable"

func _get_text():
	return ""

func _get_category():
	return "Access"

func _has_input_sequence_port():
	return true

func _get_output_sequence_port_count():
	return 1

func _get_output_sequence_port_text(idx):
	return ""

func _get_input_value_port_count():
	return 3

func _get_input_value_port_type(idx):
	if idx == 0:
		return TYPE_OBJECT
	return TYPE_STRING

func _get_input_value_port_name(idx):
	if idx == 0:
		return "Self"
	elif idx == 1:
		return "ScriptName"
	return "Variable"

func _get_output_value_port_count():
	return 1

func _get_output_value_port_name(idx):
	return "Value"

func _step(inputs, outputs, start_mode, working_mem):
	if inputs[0].has_node("/root/"+inputs[1]):
		var script = inputs[0].get_node("/root/"+inputs[1])
		outputs[0] = script.get(inputs[2])
	else:
		# throw error
		return "ERROR: The Script/Singleton does not exists."
	return 0