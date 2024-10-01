isempty = instance_place(x+32, y,o_item);

if mine_counter > mine_interval
{
	if isempty == noone
	{
		mine_counter = 0;
		instance_create_depth(spawn_x,spawn_y,-1,o_item)
	}
} else
{
	mine_counter += mine_speed;
}
 

mine_counter_pc = (mine_counter / mine_interval) * 100;