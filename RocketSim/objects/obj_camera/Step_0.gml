// Set the amount to increase or decrease the viewport size
zoom_step = 100;

// Get the current camera view size
cam = view_camera[0];
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);

// Check for mouse wheel input and adjust the view size
if (mouse_wheel_up()) {
    view_w = max(view_w - zoom_step, 500); // Replace 'minimum_width' with your desired minimum
    view_h = max(view_h - zoom_step, 500); // Replace 'minimum_height' with your desired minimum
} else if (mouse_wheel_down()) {
    view_w = min(view_w + zoom_step, 10000); // Replace 'maximum_width' with your desired maximum
    view_h = min(view_h + zoom_step, 10000); // Replace 'maximum_height' with your desired maximum
}

// Set the new camera view size
camera_set_view_size(cam, view_w, view_h);

view_w = camera_get_view_width(view_camera[0]); 
view_h = camera_get_view_height(view_camera[0]);

x = obj_rocket.x + view_w/2 - (3/100)*view_w;
y = obj_rocket.y + view_h/2;
