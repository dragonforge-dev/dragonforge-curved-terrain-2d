@tool
class_name CurvedTerrain2D extends Path2D

## The image to fill the inside
@export var fill_texture: Texture2D
## The image to use as the edge of the terrain.
@export var edge_texture: Texture2D
## The thickness of the edge terrain. Adjusting this will change the look and smoothness of the edge.
@export var edge_depth: float = 30.0
@export_category("Collision")
## The physics layers this [CurvedTerrain2D] is in. Curved terrain objects can exist in one or more of 32 different layers. See also [member CurvedTerrain2D.mask].
## [br][br][b]Note:[/b] Object A can detect a contact with object B only if object B is in any of the layers that object A scans. See Collision layers and masks in the documentation for more information.
@export_flags_2d_physics var layer: int = 1
## The physics layers this [CurvedTerrain2D] scans. Curved terrain objects can scan one or more of 32 different layers. See also [member CurvedTerrain2D.layer].
## [br][br][b]Note:[/b] Object A can detect a contact with object B only if object B is in any of the layers that object A scans. See Collision layers and masks in the documentation for more information.
@export_flags_2d_physics var mask: int = 1
## Turns visible collision shapes on and off in the editor. Has no effect in the game.
@export var show_collision_shape: bool = false

var polygon_2d: Polygon2D
var line_2d: Line2D
var collision_static_body_2d: StaticBody2D
var collision_polygon_2d: CollisionPolygon2D


func _ready() -> void:
	curve.bake_interval = 20
	polygon_2d = Polygon2D.new()
	polygon_2d.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	add_child(polygon_2d)
	
	line_2d = Line2D.new()
	line_2d.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	line_2d.texture_mode = Line2D.LINE_TEXTURE_TILE
	add_child(line_2d)
	
	collision_static_body_2d = StaticBody2D.new()
	add_child(collision_static_body_2d)
	collision_polygon_2d = CollisionPolygon2D.new()
	collision_static_body_2d.add_child(collision_polygon_2d)
	
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	_regenerate()


func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		set_process(false)
		return
	_regenerate()


func _regenerate() -> void:
	if !curve or curve.point_count == 0:
		collision_polygon_2d.polygon = []
		polygon_2d.polygon = []
		line_2d.points = []
		return
	
	var points = curve.get_baked_points()
	var collider_points = curve.get_baked_points()
	
	if points.size() > 1:
		points.append(points[1])
	
	collision_static_body_2d.collision_layer = layer
	collision_static_body_2d.collision_mask = mask
	
	polygon_2d.polygon = points
	polygon_2d.texture = fill_texture
	
	line_2d.points = points
	line_2d.texture = edge_texture
	line_2d.width = edge_depth
	
	if collider_points.size() > 2:
		collision_polygon_2d.polygon = collider_points
	collision_polygon_2d.visible = show_collision_shape
