isempty = instance_place(x+32, y,o_item);

if mine_counter > game_get_speed(gamespeed_fps)
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
 
