var change_in_time = (global.data[# 0, step] - time)/1000;

extension_level = min(global.data[# 5, step], 2);
image_index = min(global.data[# 5, step], 2);

pitch = real(global.data[# 3, step]);
yaw = real(global.data[# 4, step]);

time = global.data[# 0, step]; // update time

altitude = real(global.data[# 2, step])-1.5; // set altitude

velocity = real(global.data[# 1, step]);

angle_of_attack = real(global.data[# 8, step]);

x = x + 157*(tan(angle_of_attack)*velocity)*change_in_time; // update x position with angle of attack

y = 47000-(157*altitude); // update y position

image_angle = -(angle_of_attack * 180 / pi);

if (!paused && step < ds_grid_height(global.data)-1) {
	step++;
}

if(global.data[# 6,step]){
	var ps = part_system_create_layer("Instances_2", false);
	part_particles_burst(ps,x,y-56,par_jet);
}

if(keyboard_check_pressed(vk_space)){
paused = !paused;	
}

if(keyboard_check_pressed(ord("R"))){
step=0;
}