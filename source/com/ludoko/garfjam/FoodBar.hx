package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class FoodBar extends FlxSprite
{

	public var amount:Float = 1000;
	public var decreaseSpeed:Float = 50;
	
	private var _x:Float;
	private var _maxScale:Float;
	
	public function new() 
	{
		super(G.halfWidth - 8, FlxG.height - 93, "assets/images/lasagna.png");
		antialiasing = false;
		
		scale.x = _maxScale = 6;
		scale.y = 1.333;
		
		_x = x - Math.floor(129 * _maxScale * 0.5);
	}
	
	override public function update():Void 
	{
		amount -= FlxG.elapsed * decreaseSpeed;
		
		scale.x = amount / 1000 * 6;
		x = _x + Math.floor(129 * scale.x * 0.5);
		
		super.update();
	}
	
}