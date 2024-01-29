var cam = view_camera[0];
if (camera_mode == 0){
	// Set the amount to increase or decrease the viewport size
	var zoom_stepw = (view_w)/2;
	var zoom_steph = (view_h)/2;

	// Get the current camera view size
	view_w = camera_get_view_width(cam);
	view_h = camera_get_view_height(cam);

	// Check for mouse wheel input and adjust the view size
	if (mouse_wheel_up()) {
	    view_w = max(view_w - zoom_stepw, 160); 
	    view_h = max(view_h - zoom_steph, 90); 
	} else if (mouse_wheel_down()) {
	    view_w = min(view_w + zoom_stepw, 16000);
	    view_h = min(view_h + zoom_steph, 9000); 
	}

	// Set the new camera view size
	camera_set_view_size(cam, view_w, view_h);

	//x = obj_rocket.x + view_w/2 - (3/100)*view_w;
	//y = obj_rocket.y + view_h/2;

	if(mouse_check_button(mb_middle)){
		x+=0.1*point_distance(x,0,mouse_x,0)*sign(mouse_x-x);
		y+=0.1*point_distance(0,y,0,mouse_y)*sign(mouse_y-y);
	}
	else{
		x+=0.1*point_distance(x,0,obj_rocket.x,0)*sign(obj_rocket.x-x);
		y+=0.1*point_distance(0,y,0,obj_rocket.y)*sign(obj_rocket.y-y);
	}

	camera_set_view_pos(cam,x-0.5*view_w,y-0.5*view_h);
} else if (camera_mode == 1){
	camera_set_view_size(cam, 83556, 47000);
	camera_set_view_pos(cam, 0, 0);
}