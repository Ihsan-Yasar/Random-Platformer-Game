//Get Player Input
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_jump = keyboard_check_pressed(vk_space);

//Calculate Movement
var _move = _key_right - _key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x, y + 1, oWall))  &&  (_key_jump)
{
	vsp = -7;
}	

//Horizontal Collision
if (place_meeting(x + hsp, y, oWall))
{
    while (!place_meeting(x + sign(hsp), y, oWall))
	{
        x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x, y + vsp, oWall))
{
    while (!place_meeting(x, y + sign(vsp), oWall))
	{
        y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x, y + 1, oWall))
{
	sprite_index = sLittlePj;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
	    sprite_index = sLittleP;
	}
	else	
	{
	     sprite_index = sLittlePr;
	}
}

if (hsp  != 0) image_xscale = sign(hsp);