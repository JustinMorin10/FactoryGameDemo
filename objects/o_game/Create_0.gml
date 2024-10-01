randomize();

enum DIRECTIONS
{
	RIGHT = 0,
	UP = 90,
	LEFT = 180,
	DOWN = 270
}

enum STATES
{
	IDLE,
	MOVE,
	DROPPING_OFF
}

belt_dir = DIRECTIONS.RIGHT;
grid_size = 32;
pe = 0;
belt_index = 0;