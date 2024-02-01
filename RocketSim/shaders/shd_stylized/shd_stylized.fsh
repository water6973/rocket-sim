//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 st = v_vTexcoord;
	vec4 col = texture2D( gm_BaseTexture, st);
	
	float rand = fract(sin(st.x*st.y*34532.2552)*st.x*st.y*6578567.2234);
	float rr = fract(sin(st.x*st.y*22364.2552*col.r)*st.x*st.y*23498567.2234*col.r);
	float rg = fract(sin(st.x*st.y*634632.2552*col.g)*st.x*st.y*75438567.2234*col.g);
	float rb = fract(sin(st.x*st.y*745732.2552*col.b)*st.x*st.y*4538567.2234*col.b);
	
	float avg = (col.r+col.g+col.b)/3.0;
	col.r+=rr-0.2;
	col.g+=rg-0.1;
	col.b+=rb+0.1;
	
    gl_FragColor = col;
}
