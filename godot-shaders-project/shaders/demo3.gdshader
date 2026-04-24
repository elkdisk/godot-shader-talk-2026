shader_type canvas_item;

uniform sampler2D overlay_image1;
uniform sampler2D overlay_image2;
uniform vec4 tint_color1: source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 tint_color2: source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec2 direction1 = vec2(1.0, 1.0);
uniform vec2 direction2 = vec2(-1.0, 1.0);
uniform float speed1 = 0.1;
uniform float speed2 = 0.199;
uniform float alpha1 = 0.5;
uniform float alpha2 = 0.5;


void fragment() {
	vec2 scroll1 = direction1 * speed1 * TIME;
	vec2 scroll2 = direction2 * speed2 * TIME;
	vec2 uv1 = fract(UV + scroll1);
	vec2 uv2 = fract(UV + scroll2);

	vec4 source = texture(TEXTURE, UV);
	vec4 overlay1 = texture(overlay_image1, uv1);
	overlay1 *= tint_color1;
	vec4 overlay2 = texture(overlay_image2, uv2);
	overlay2 *= tint_color2;
	
	vec4 overlay_colors = mix(overlay1, overlay2, alpha1);

	COLOR = mix(source, overlay_colors, alpha2);
}
