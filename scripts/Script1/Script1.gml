// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckAndPlaceStorage(){
	// find if there are any stacks with the current items ID
		// maybe a for loop? loop through the array
	for (var i = 0; i < input.stack_slots; i++)
	{
		var slot_id = input.stack_id[i]
		var slot_qty = input.stack_qty[i]
		//show_debug_message("Fill ID position. i = {0} | slot_id = {1} | slot_qty = {2}", i, slot_id, slot_qty);
		// if there is an ID that matches, stop searching and check if quantity is !100
		if slot_id == item_id && slot_qty < input.max_stack_qty
		{
			input.stack_qty[i] += 1;
			//show_debug_message("Fill ID position: " + string(i) + "slot ID: " + string(slot_id) + "qty: " + string(slot_qty))
			other.empty = true;
			instance_destroy(self)
			//show_debug_message("==========================================");
			break;
		}
		if input.stack_id[i] == noone && input.stack_qty[i] < input.max_stack_qty
		{
			input.stack_id[i] = item_id;
			input.stack_qty[i] += 1;
			//show_debug_message("Fill ID position, and made new ID position")
			other.empty = true;
			instance_destroy(self)
			//show_debug_message("==========================================");
			break;	
		}
	}
}