// if the item is sitting and waiting on the input decide direction to go next
if state == 0
{
	other.empty = false; // current input object on is set to not empty
	dir = other.dir // pull direction of input onto item
	switch other.dir // based on direction check to see if location has a input in that location
	{
		case DIRECTIONS.RIGHT: // direction of input is RIGHT
			input = instance_position(x+32, y, [o_belt, o_storage]); // check position RIGHT to current pos. and see if a input is there
			break;
		case DIRECTIONS.LEFT: // direction of input is LEFT
			input = instance_position(x-32, y, [o_belt, o_storage]); // check position LEFT to current pos. and see if a input is there
			break;
		case DIRECTIONS.DOWN: // direction of input is DOWN
			input = instance_position(x, y+32, [o_belt, o_storage]); // check position DOWN (below) current pos and see if a input is there
			break;
		case DIRECTIONS.UP: // direction of input is UP
			input = instance_position(x, y-32, [o_belt, o_storage]); // check position UP (above) current pos and see if a input is there
			break;
	}
	if input != noone // if the next input exists in the direction
	{
		switch input.object_index // check which input object is adjacent
		{
			case o_belt:
				if place_empty(input.x,input.y,o_item) == true // and the next input pos does not have an item there
				{
					//set new location to next input center, and move there. reset state to moving and he
					old_belt = other
					new_point_x = input.x;
					new_point_y = input.y;
					move_towards_point(new_point_x, new_point_y, input.belt_spd);
					state = 1;
				}
				break;
			case o_storage:
					CheckAndPlaceStorage(); // check if storage is available, if there is deposit
				break;	
		}
	}
}