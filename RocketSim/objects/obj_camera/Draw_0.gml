var _camera = camera_get_active();
camera_set_view_mat(_camera, matrix_build_lookat(posx,posy,posz,room_width,room_height,16,0,0,-1));
camera_set_proj_mat(_camera,matrix_build_projection_perspective_fov(80,window_get_width()/window_get_height(),1,3200));
camera_apply(_camera);
