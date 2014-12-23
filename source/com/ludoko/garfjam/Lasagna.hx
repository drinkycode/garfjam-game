package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Michael Lee
 */
class Lasagna extends FlxSprite
{
	
	public static var _group:FlxGroup;
	
	private var _shake:Float = 0;
	private var _pulse:Float = 0;
	
	public static function create(X:Float, Y:Float):Lasagna
	{
		var l:Lasagna = cast _group.getFirstDead();
		if (l == null)
		{
			l = new Lasagna();
			_group.add(l);
		}
		l.reset(X, Y);
		return l;
	}

	public function new() 
	{
		super();
		
		loadGraphic("assets/images/lasagna.png");
	}
	
	override public function update():Void 
	{
		super.update();
		
		_shake += FlxG.elapsed * 2.5;
		angle = Math.sin(_shake) * 33;
		
		_pulse += FlxG.elapsed * 2;
		scale.x = scale.y = 0.666 + Math.cos(_pulse) * 0.1;
	}
	
}