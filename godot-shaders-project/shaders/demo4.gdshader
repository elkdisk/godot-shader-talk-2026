shader_type canvas_item;

uniform float rotation_speed = 0.5;

void fragment() {
	vec2 center = vec2(0.5, 0.5);
	vec2 uv_rot = UV - center;
	float angle = rotation_speed * TIME;
	float s = sin(angle);
	float c = cos(angle);
	uv_rot = vec2(uv_rot.x * c - uv_rot.y * s, uv_rot.x * s + uv_rot.y * c);
	uv_rot += center;
	uv_rot = fract(uv_rot);
	
	COLOR = texture(TEXTURE, uv_rot);
}
