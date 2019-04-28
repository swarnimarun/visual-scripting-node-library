tool
extends VisualScriptCustomNode

enum Types {DATA, SEQUENCE}
export(Types) var type = 0 setget set_type

func set_type(to):
	type = to
	ports_changed_notify()

func _get_input_value_port_count():
	if type == Types.DATA:
		return 1

func _get_output_value_port_count():
	if type == Types.DATA:
		return 1

func _get_output_sequence_port_count():
	if type == Types.SEQUENCE:
		return 1

func _has_input_sequence_port():
	return type == Types.SEQUENCE

func _get_caption():
	return "Reroute"

func _get_text():
	return ""

func _step(inputs, outputs, start_mode, working_mem):
	if type == Types.DATA:
		outputs[0] = inputs[0]
	return 0
