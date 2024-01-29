//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	float avg = (col.r+col.g+col.b)/3.0;
	col.r=avg;
	col.g=avg;
	col.b=avg;
	
    gl_FragColor = col;
}
