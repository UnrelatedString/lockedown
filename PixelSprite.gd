extends AnimatedSprite

const pixelSize = 4;

func _process(_delta):
	var pixelPos = get_global_transform().origin;
	offset.x = -fposmod(pixelPos.x,pixelSize);
	offset.y = -fposmod(pixelPos.y,pixelSize);
