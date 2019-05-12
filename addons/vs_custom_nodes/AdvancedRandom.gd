tool
extends VisualScriptCustomNode

enum Types {INTEGER = TYPE_INT, FLOATING_POINT_VALUE = TYPE_REAL, VECTOR2 = TYPE_VECTOR2, VECTOR3 = TYPE_VECTOR3}
export(Types) var type = 0 setget set_type

func _get_caption():
	return "Advanced Random"

func set_type(to):
	type = to
	ports_changed_notify()
	Color(0.333333, 0.14902, 0.14902, 0.352941)

func _get_category():
	return "Math"

func _get_input_value_port_count():
	return 2

func _get_input_value_port_name(idx):
	if idx == 0:
		return "from"
	else:
		return "to"

func _get_input_value_port_type(idx):
	return type

func _get_output_value_port_count():
	return 1

func _get_output_value_port_type(idx):
	return type

func _step(inputs, outputs, start_mode, working_mem):
	if start_mode == START_MODE_BEGIN_SEQUENCE:
		var from = inputs[0]
		var to = inputs[1]
		var out

		if typeof(from) != type or typeof(to) != type:
			return "Input doesn't match specified type!"

		match type:
			Types.VECTOR2:
				out = Vector2(rand_range(from.x, to.x), rand_range(from.y, to.y))
			Types.VECTOR3:
				out = Vector3(rand_range(from.x, to.x), rand_range(from.y, to.y), rand_range(from.z, to.z))
			Types.INTEGER:
				out = rand_range(from, to)
			Types.FLOATING_POINT_VALUE:
				out = rand_range(from, to)
		outputs[0] = out
	return 0
