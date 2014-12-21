package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Michael Lee
 */
class Laser extends FlxSprite
{
	
	public static var _group:FlxGroup;
	
	public static function create(X:Float, Y:Float, Direction:Int):Laser
	{
		var l:Laser = cast _group.getFirstDead();
		if (l == null)
		{
			l = new Laser();
			_group.add(l);
		}
		l.resetLaser(X, Y, Direction);
		return l;
	}

	public function new() 
	{
		super();
		
		makeGraphic(96, 4, 0xffff00ff);
	}
	
	public function resetLaser(X:Float, Y:Float, Direction:Int):Void
	{
		reset(X - Math.floor(width * 0.5), Y);
		
		scale.x = 0;
		
		if (Direction == FlxObject.LEFT)
		{
			velocity.x = -500;
		}
		else
		{
			velocity.x = 500;
		}
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (scale.x < 1)
		{
			scale.x += FlxG.elapsed * 10;
			if (scale.x > 1)
			{
				scale.x = 1;
			}
		}
		
		if (velocity.x < 0)
		{
			if (x + width < 0)
			{
				kill();
			}
		}
		else
		{
			if (x > FlxG.width)
			{
				kill();
			}
		}
	}
	
}