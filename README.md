[![Static Badge](https://img.shields.io/badge/Godot%20Engine-4.5.stable-blue?style=plastic&logo=godotengine)](https://godotengine.org/)

# Dragonforge Curved Terrain 2D
Plugin that adds a **CurvedTerrain2D** node that can be used to create curved 2D terrains.
# Version 1.0
For use with **Godot 4.5.stable** and later.
# Installation Instructions
1. Copy the `dragonforge_curved_terrain_2d` folder from the `addons` folder into your project's `addons` folder.

# Usage Instructions
This plugin was inspired by these two videos. They deswcribe in detail how to modify curves to make this plugin work.
- [How to make 2D Curved Terrain in Godot 4 - Tutorial](https://www.youtube.com/watch?v=7br07d1aoSo)
- [Create a Custom 2D Curved Terrain Plugin in Godot 4.4](https://www.youtube.com/watch?v=CeGIlBKC_KU)
## Add a CurvedTerrain2D Node
1. Add a new node as you would normally. (The **Create New Node** window will appear.)
2. Type `curved` into the Search box.
3. Select **CurvedTerrain2D**.
4. Click the **Create** button.

## Configure a CurvedTerrain2D Node
1. Drag-and-drop a texture into **Fill Texture**. If you're using a tileset, pick the center tile.
2. Drag-and-drop a texture into **Edge Texture**. If you're using a tileset, use the top center tile.
3. Click on the **CurvedTerrain2D** node and use the **Curve Toolbar** at the top of the screen to create and edit points for your terrain.
4. Adjust the **Edge Depth** to alter the look of the edge.
5. Set the collision layers and masks. Typically terrain only neds to be on a layer and needs no masks. (For consistency the defaults match typical Godot defaults.)

# Class Descriptions
## CurvedTerrain2D

### Export Variables
- `fill_texture: Texture2D` The image to fill the inside
- `edge_texture: Texture2D` The image to use as the edge of the terrain.
- `edge_depth: float = 30.0` The thickness of the edge terrain. Adjusting this will change the look and smoothness of the edge.
- `layer: int = 1` The physics layers this [CurvedTerrain2D] is in. Curved terrain objects can exist in one or more of 32 different layers. See also [member CurvedTerrain2D.mask]. **Note:** Object A can detect a contact with object B only if object B is in any of the layers that object A scans. See Collision layers and masks in the documentation for more information.
- `mask: int = 1` The physics layers this [CurvedTerrain2D] scans. Curved terrain objects can scan one or more of 32 different layers. See also [member CurvedTerrain2D.layer]. **Note:** Object A can detect a contact with object B only if object B is in any of the layers that object A scans. See Collision layers and masks in the documentation for more information.
- `show_collision_shape: bool = false` Turns visible collision shapes on and off in the editor. Has no effect in the game.
