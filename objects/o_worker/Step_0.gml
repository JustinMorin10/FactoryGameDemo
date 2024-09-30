switch state
{
	case STATES.IDLE:
		idle_counter += irandom(4)
		if idle_counter >= idle_cooldown
		{
			if carrying != noone
			{
				state = STATES.DROPPING_OFF;
				storage = instance_nearest(x,y,o_storage);
				new_x = storage.x;
				new_y = storage.y;
			}
			else
			{
				state = STATES.MOVE;
				new_x = irandom_range(-150,150) + x;
				new_y = irandom_range(-150,150) + y;
				if irandom(100) < 5
				{
					carrying = irandom(sprite_get_number(s_item));
				}
			}
			image_speed = 1;
			idle_counter = 0;
			var path = path_add();
			mp_potential_path_object(path, new_x, new_y, move_speed, 4, o_collider);
			path_start(path, 1, path_action_stop, true);
		}
		break;
	case STATES.MOVE:
		if path_position == 1
		{
			state = STATES.IDLE;
			image_speed = 0;
			image_index = 0;
		}
		break;
	case STATES.DROPPING_OFF:
		dis = distance_to_point(storage.x + (sprite_get_width(s_storage)/2), storage.y + (sprite_get_height(s_storage)/2));
		if dis < 50
		{
			state = STATES.IDLE;
			image_speed = 0;
			image_index = 0;
			carrying = noone;
			path_end()
		}
		if x == xprevious && y == yprevious
		{
			ai_timeout += 1;
		}
		break;
}

if direction > 90 && direction < 270
{
	image_xscale = -1;	
} 
else
{
	image_xscale = 1;	
}

if carrying != noone
{
	sprite_index = s_worker_carry;	
}
else
{
	sprite_index = s_worker;	
}

if ai_timeout > game_get_speed(gamespeed_fps) * .1
{
	dir = irandom(360)
	move_towards_point(x+lengthdir_x(1,dir), y+lengthdir_y(1,dir),1)
	ai_timeout = 0;
	state = STATES.IDLE;
	idle_counter = idle_cooldown / 2
}

depth = -y