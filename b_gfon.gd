extends ParallaxBackground

var speed = 135

func _process(delta):
	scroll_offset.x -= speed * delta
