tool
extends VisualScriptCustomNode

func _get_output_value_port_count():
	return 1
func _get_output_value_port_type(idx):
	return TYPE_DICTIONARY

func _get_caption():
	return "Load Directory"
func _get_text():
	return ""
func _get_category():
	return "Input"

func _get_input_value_port_count():
	return 1
func _get_input_value_port_name(idx):
	return "Directory"
func _get_input_value_port_type(idx):
	return TYPE_STRING

func _get_working_memory_size():
	return 1

func _step(inputs, outputs, start_mode, working_mem):
	if not working_mem[0]:
		var dir = Directory.new()
		if not dir.open(inputs[0]) == OK:
			return "Invalid path"

		dir.list_dir_begin(true, true)

		var resources = {}
		var file_name = dir.get_next()

		while file_name != "":
			var to_load = inputs[0].plus_file(file_name)
			if ResourceLoader.exists(to_load):
				resources[file_name.get_basename()] = load(to_load)
			file_name = dir.get_next()

		working_mem[0] = resources

	outputs[0] = working_mem[0]
	return 0
