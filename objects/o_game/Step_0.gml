// when hovering we should display a ghost of what we will place
// we need a key to rotate the piece
// we need the left click to add belts
// right click to remove?? maybe

var place = mouse_check_button_pressed(mb_left);
var rotate = keyboard_check_pressed(ord("Q"));

place_x = (floor(mouse_x / grid_size) * grid_size) + (grid_size/2);
place_y = (floor(mouse_y / grid_size) * grid_size) + (grid_size/2);

if rotate
{
	// add 90 degrees to the diR
	if belt_dir == 0
	{
		belt_dir = 90;
	}
	else if belt_dir == 90
	{
		belt_dir = 180;
	}
	else if belt_dir == 180
	{
		belt_dir = 270;
	}
	else if belt_dir == 270
	{
		belt_dir = 0;
	}
	// belt_dir += 90;
}

if place
{
	var px = place_x;
	var py = place_y;
	var new_belt = instance_create_depth(place_x,place_y,0,o_belt);
	new_belt.dir = belt_dir; // we can set the direction here
	new_belt.image_angle = belt_dir;
}