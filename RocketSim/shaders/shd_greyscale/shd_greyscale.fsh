//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 st = v_vTexcoord;
	vec4 col = texture2D( gm_BaseTexture, st);
	
	float r = fract(sin(st.x*st.y*25632.2552)*st.x*st.y*2398567.2234);
	
	float avg =0.1*r+ (col.r+col.g+col.b)/3.0;
	col.r=avg;
	col.g=avg;
	col.b=avg;
	
    gl_FragColor = col;
}
