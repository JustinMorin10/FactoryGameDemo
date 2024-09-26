if state == 0
{
	other.empty = false;
	dir = other.dir
	switch other.dir
	{
		case DIRECTIONS.RIGHT:
			belt = instance_position(x+32, y, o_belt);
			break;
		case DIRECTIONS.LEFT:
			belt = instance_position(x-32, y, o_belt);
			break;
		case DIRECTIONS.DOWN:
			belt = instance_position(x, y+32, o_belt);
			break;
		case DIRECTIONS.UP:
			belt = instance_position(x, y-32, o_belt);
			break;
	}
}
other.empty = true;

if belt != noone
{
	if place_empty(belt.x,belt.y,o_item) == true
	{
		new_point_x = belt.x;
		new_point_y = belt.y;
		move_towards_point(new_point_x, new_point_y, .5);
		state = 1;
		other.empty = true;
	}
}