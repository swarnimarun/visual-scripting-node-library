# Make sure to use tool keyword as the code needs to run in the editor
tool
extends VisualScriptCustomNode

func _get_caption(): # the name of the custom node [Make sure to give them longer names to be able to find them with ease].
	return "Get Input Direction 2D"

func _get_category(): # the category of the custom node
	return "Input"
	
func _get_text(): # the text displayed after input sequence arrow/port
	return ""
	
func _get_input_value_port_count(): # number of inputs to be taken
	return 0

func _get_input_value_port_type(idx): # type of the inputs per index starting from 0
	return TYPE_OBJECT
	
func _get_output_value_port_count(): # number of outputs to be given
	return 1
	
func _get_output_value_port_type(idx): # type of outputs per index starting from 0
	return TYPE_VECTOR2
	
func _get_output_value_port_name(idx): # name/text displayed before output node per index
	return "Direction"

func _has_input_sequence_port(): # if the node requires sequence port
	return true
	
func _get_output_sequence_port_count(): # number of output sequence ports to use(have at least one if you have an input sequence port)
	return 1
	
func _step(inputs, outputs, start_mode, working_mem): # the primary method where all the working takes place
	
	# inputs array is used as data and can be accessed as input[0] and so on.....
	
	var x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	# output array is used to give out output, and you only have to give the value
	                 # to the specific index of outputs to give out output of any kind
	outputs[0] = Vector2(x,y)
	
	# you can use start_mode to check and see if you have to perform the operation again and again or not
	# i.e. to say that you can use the _step() as ready when the start_modes value tells that
	# it's the first iteration or as process...........
	
	# and finally working memory can be used to check the working memory and it's size. Read more about it in the godot-docs.
	
	return 0 # return the error string for errors else 0
	