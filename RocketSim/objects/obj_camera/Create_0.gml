camera_mode = 0; // 0 is locked, 1 is unlocked

view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

x = obj_rocket.x ;
y = obj_rocket.y ;

surface_resize(application_surface,camera_get_view_width(view_camera[0])*2, camera_get_view_height(view_camera[0])*2);