var change_in_time = global.data[# 0, step] - time; 
image_index = global.data[# 5, step];
time = global.data[# 0, step]; // update time

altitude = real(global.data[# 2, step])-58; // set altitude

velocity = real(global.data[# 1, step]);

angle_x = sin(pitch/180 * pi);    // Effect of pitch on x
angle_y = sin(yaw/180 * pi);      // Effect of yaw on y
angle_z = cos(pitch/180 * pi) * cos(yaw/180 * pi); // Combined effect on z

// Calculate the angle of attack as the angle between the directional vector and the vertical axis (z-axis)
angle_of_attack = arccos(angle_z / sqrt(angle_x * angle_x + angle_y * angle_y + angle_z * angle_z));

// x += round(157*(tan(angle_of_attack)*velocity)*change_in_time); // update x position with angle of attack

y = 47000-(157*altitude); // update y position
show_debug_message(y);

image_angle = -(angle_of_attack * 180 / pi);

if (!paused) {
	step++;
}

if(global.data[# 6,step]==true){
	var ps = part_system_create_layer("Instances_2", false);
	part_particles_burst(ps,x,y-56,par_jet);
}