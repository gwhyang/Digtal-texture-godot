shader_type canvas_item;

uniform float outline = .5;
uniform float innerline = .3;

uniform vec4 out_color : source_color = vec4(0.0,0.0,0.0,1.0);
uniform vec4 inner_color : source_color = vec4(1,1,1,1);
uniform vec4 left_color : source_color = vec4(0,0,0,0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	float dist = length(uv - vec2(.5,.5));
	if (dist <= innerline){
		COLOR = inner_color;
	}
	else {if (dist <= outline){
		COLOR = out_color;}
	else {
		COLOR = left_color;
	}
	}
}
