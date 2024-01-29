/// @description Insert description here
// You can write your code in this editor

shader_set(shd_stylized);
draw_surface(application_surface,0,0)
shader_reset();

draw_set_color(c_red);
draw_text_ext_transformed(0,0, "Time: " + string(time) + "ms	Velocity: " + string(velocity) + "m/s	Altitude: " + string(altitude) + "m		Angle of Attack: " + string(angle_of_attack) + "radians		Extension Level: " + string(extension_level),10,10000,10,10,0);
