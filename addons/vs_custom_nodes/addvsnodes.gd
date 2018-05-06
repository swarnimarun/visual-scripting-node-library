tool
extends EditorPlugin

#const vsnode1 = preload("res://addons/vs_custom_nodes/node1.gd") # place holders for future nodes
#const vsnode2 = preload("res://addons/vs_custom_nodes/node2.gd")
#const vsnode3 = preload("res://addons/vs_custom_nodes/node3.gd")
#actual test script
const getinput = preload("res://addons/vs_custom_nodes/GetInputDirection2D.gd")

func _enter_tree():
	VisualScriptEditor.add_custom_node("GetInputDirection2D", "Input", getinput)
#	if vsnode1 == null || vsnode2 == null || vsnode3 == null:
#		return
#	VisualScriptEditor.add_custom_node("Node 1", "Extensions", vsnode1)
#	VisualScriptEditor.add_custom_node("Node 2", "Extensions", vsnode2)
#	VisualScriptEditor.add_custom_node("Node 3", "Extensions", vsnode3)
	
func _exit_tree():
	VisualScriptEditor.remove_custom_node("GetInputDirection2D", "Input")
#	if vsnode1 == null || vsnode2 == null || vsnode3 == null:
#		return
#	VisualScriptEditor.remove_custom_node("Node 1", "Extensions")
#	VisualScriptEditor.remove_custom_node("Node 2", "Extensions")
#	VisualScriptEditor.remove_custom_node("Node 3", "Extensions")