change_in_time = global.data[0, step] - time; 
time = global.data[0, step]; // update time

angle_x = sin(pitch/180 * pi);    // Effect of pitch on x
angle_y = sin(yaw/180 * pi);      // Effect of yaw on y
angle_z = cos(pitch/180 * pi) * cos(yaw/180 * pi); // Combined effect on z

// Calculate the angle of attack as the angle between the directional vector and the vertical axis (z-axis)
angle_of_attack = arccos(angle_z / sqrt(angle_x * angle_x + angle_y * angle_y + angle_z * angle_z));
x += 39*(tan(angle_of_attack)*velocity)*change_in_time; // update x position with angle of attack

y = 47000-(39*global.data[2, step]); // update y position
altitude = y;

image_angle = -(angle_of_attack * 180 / pi);

if (!paused) {
	step++;
}