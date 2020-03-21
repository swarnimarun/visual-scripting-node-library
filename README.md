# Visual Scripting Custom Nodes Library

This library is a collection of visual script custom nodes that anyone can use in their projects.

It's purpose is to make the __visual scripting work flow__ in Godot easier.

__Some nodes from the library in use:__

![EXAMPLE](https://i.imgur.com/rws1bBY.png)

-------


### Follow me at: [Twitter: @steincodes](https://www.twitter.com/Steincodes) and Find Tutorials about this at [Youtube:Steincodes](https://www.youtube.com/c/steincodes)

------

## Steps for using the Library

To use the custom nodes in this library you have to copy the `addons` folder from this repo into your project.

Then go to  `Project Setting>Plugins` and set the status of the `VisualScript Library` plugin to activate.

![Project Settings Window](https://i.imgur.com/V6Mh7hA.png)

## Explanation of the nodes

### The `Load Directory` node

This node is useful for loading all the files in a directory into a [dictionary](http://docs.godotengine.org/en/latest/classes/class_dictionary.html). These files can be any files that can be loaded with the [ResourceLoader](https://docs.godotengine.org/en/latest/classes/class_resourceloader.html). This is useful for loading random scenes or textures for example.

__Apply a random texture from the `Sprites` folder to a sprite:__

![Load Random Texture](https://imgur.com/xzSyGei.png)

## How you can contribute

You can contribute in many ways; If you have questions or suggestions, just open an issue here on GitHub. If you have an idea for a node, be sure to first post it in the Node Brainstorming issue (#4), so you can get feedback. After your idea has been approved, follow these steps:

1. Get started by making a fork![fork](https://img.icons8.com/ios-glyphs/30/000000/code-fork.png) of this repository and creating a branch for your custom node

2. Create a new Godot project and either copy the `addons` folder into it or create a symlink. The `addons` folder is where Godot loads plugins from, so it's name is important.

3. Create a new GDScript in the `addons/vs_custom_nodes` directory. Name it by the name of your custom node in *CamelCase*, which should not include the word "Node" and describe what is does, for example `EatApples`.

4. Now it's time to get started scripting our custom node! All custom nodes should extend `VisualScriptCustomNode` and have a `tool` keyword at the top.

   ![1557600176008](https://imgur.com/TigRBzW.png)

5. There are some getter functions you will need to add to set some parameters. Look at some of the existing nodes to see what you need. Only add functions that are really needed, you don't need a `_has_input_sequence_port` if it should return `false` for example.
   ![1557600238543](https://imgur.com/X1NqUsj.png)

6. Now comes the most important part of your custom node, the `_step` function. All the logic happens in here. You can modify the `output` array and the `working_mem` to create your functionality.
   If you want to throw an error, if the inputs are incorrect for example, then you need to return the error as a string. When everything goes all right, return the id of the sequence port which should be called next. If your custom node doesn't have any, just return 0.

7. If you have your custom node all done, you need to register it in `addvsnodes.gd`. Add a p`preload` statement at the top, a `add_custom_node` one in `_enter_tree` and a `remove_custom_node` in `_exit_tree`. Be sure to give it a unique id and the correct category.

8. Now you can test your node by enabling the plugin in *Project->Project Settings->Plugins* and adding your custom node to a VisualScript.
   ![Project Settings Window](https://i.imgur.com/V6Mh7hA.png)

9. If it works how you want it to, create a pull request ![pullrequest](https://img.icons8.com/ios-glyphs/30/000000/merge-git.png) and wait for it to be merged.


For help PM me on @steincodes on Twitter and follow me there for more updates on the project.

Keep track in the project board of any updates and plans before starting something.