extends Node3D;

@export var enemy_scene: PackedScene;
@export var navmesh: NavigationRegion3D;
@export var designated_location: Vector3 = Vector3(565, 196, 551);

func _ready() -> void:
    spawn_enemy();

func _timeout() -> void:
    $Timer.start();
    if get_tree().get_nodes_in_group("Enemies").size() > 20:
        print("Too many enemies. Ignoring...")
        return;
    spawn_enemy();

func spawn_enemy() -> void:
    var enemy = enemy_scene.instantiate();
    enemy.designated_location = designated_location;
    enemy.navmesh = navmesh;
    enemy.starting_position = global_position;
    get_tree().root.add_child(enemy);
