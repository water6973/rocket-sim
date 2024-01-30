var change_in_time = global.data[# 0, step] - time;

extension_level = min(global.data[# 5, step], 2);
image_index = min(global.data[# 5, step], 2);

pitch = real(global.data[# 3, step]);
yaw = real(global.data[# 4, step]);

time = global.data[# 0, step]; // update time

altitude = real(global.data[# 2, step])-1.5; // set altitude

velocity = real(global.data[# 1, step]);

angle_x = sin(pitch/180 * pi);    // Effect of pitch on x
angle_y = sin(yaw/180 * pi);      // Effect of yaw on y
angle_z = cos(pitch/180 * pi) * cos(yaw/180 * pi); // Combined effect on z

// Calculate the angle of attack as the angle between the directional vector and the vertical axis (z-axis)
angle_of_attack = arccos(angle_z / sqrt(angle_x * angle_x + angle_y * angle_y + angle_z * angle_z));

// x += round(157*(tan(angle_of_attack)*velocity)*change_in_time); // update x position with angle of attack

y = 47000-(157*altitude); // update y position

image_angle = -(angle_of_attack * 180 / pi);

if (!paused && step < ds_grid_height(global.data)-1) {
	step++;
}

if(global.data[# 6,step]){
	var ps = part_system_create_layer("Instances_2", false);
	part_particles_burst(ps,x,y-56,par_jet);
}