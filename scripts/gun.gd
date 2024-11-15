extends Node3D;

@export var bullet_scene: PackedScene;
@export var shooting_timeout: float = 5;
@export var shooter_name: String;

var can_shoot: bool = true;

func _ready() -> void:
    $Timer.wait_time = shooting_timeout;

func _on_shooting_timer_timeout() -> void:
    can_shoot = true;

func shoot() -> void:
    if can_shoot:
        can_shoot = false;
        $Timer.start();
        var bullet = bullet_scene.instantiate() as Area3D;
        bullet.global_transform = $GunEnd.global_transform;
        bullet.shooter = shooter_name;
        get_tree().root.add_child(bullet);
