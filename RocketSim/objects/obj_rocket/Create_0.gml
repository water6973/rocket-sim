step=0;
image_speed = 0;
room_speed = 200;
importdata("flight_data.csv");

if (!global.data){
	show_debug_message("No data!");
}
show_debug_message("Array Length: " + string(array_length_2d(global.data, 1)));


time = 0;
velocity = 0;	
altitude=0;
pitch=0;
yaw=0;

angle_x = 0;
angle_y = 0; 
angle_z = 0;
angle_of_attack = 0;

extension_level = 2;

paused = true;