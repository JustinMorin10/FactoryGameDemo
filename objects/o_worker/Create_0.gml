move_speed = 1; // how fast can this unit move
carry_capacity = 1; // how many items can this unit hold
job = [noone, noone]; // which locations can this unit work at
carrying = choose(noone, irandom(sprite_get_number(s_item)));

carry_ypos = sprite_height + (sprite_get_height(s_item)/2) + 2

state = STATES.IDLE;
image_speed = 0;

idle_counter = 0;
idle_cooldown = game_get_speed(gamespeed_fps) * 5;

dis = 0;
dir = 0;
storage = noone

ai_timeout = 0;