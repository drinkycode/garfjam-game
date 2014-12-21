package com.ludoko.garfjam;

import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Michael Lee
 */
class Lasagna extends FlxSprite
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
	}
	
}