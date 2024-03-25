right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
jump_key_pressed = keyboard_check_pressed(vk_up);


//X movement
//Direction
move_dir = right_key - left_key;

//Get xspd
xspd = move_dir * move_spd;

//x collision

var _subPixel = .5;
if place_meeting( x + xspd, y, obj_wall ) == true
{
	//scoot up to wall precisely
	
	var _pixelCheck = _subPixel * sign(xspd);
	while !place_meeting(x + _pixelCheck, y, obj_wall)
	{
		x += _pixelCheck;
	}
	
	//set xsped to zero to "collide"
	xspd = 0;
}


  //gravity
  yspd += grav;
//jump
if jump_key_pressed && place_meeting(x, y+1, obj_wall)
  { 
	  yspd = jspd;
  }
  
//y collision
var _subPixel = .5;
if place_meeting( x, y + yspd, obj_wall ) == true
{
	//scoot up to wall precisely
	
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x, y + _pixelCheck, obj_wall)
	{
		y += _pixelCheck;
	}
	
	//set ysped to zero to "collide"
	yspd = 0;
}

x += xspd;
y += yspd;

//set sprite
if xspd > 0 {face = RIGHT};
if xspd < 0 {face = LEFT};
sprite_index = sprite[face];

//animate
if xspd == 0 && yspd == 0
    {
	image_index = 0;
    }

//depth
depth = -bbox_bottom

