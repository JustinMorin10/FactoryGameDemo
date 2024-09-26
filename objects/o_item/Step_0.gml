switch state
{
	case 1:
		dis = point_distance(x,y,new_point_x,new_point_y);
		if dis <= 1
		{
			speed = 0;
			state = 0;
		}
		break;
}