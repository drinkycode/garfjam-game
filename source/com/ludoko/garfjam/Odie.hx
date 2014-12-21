package com.ludoko.garfjam;
import flixel.FlxSprite;

/**
 * ...
 * @author Michael Lee
 */
class Odie extends FlxSprite
{

	public static var _group:FlxGroup;
	
	public static function create(X:Float, Y:Float):Odie
	{
		var o:Odie = cast _group.getFirstDead();
		if (o == null)
		{
			o = new Odie();
			_group.add(o);
		}
		o.reset(X, Y);
		return o;
	}
	
	public function new() 
	{
		super();
		
		loadGraphic("assets/images/odie.png", true, 56, 108);
	}
	
	override public function reset(X:Float, Y:Float):Void 
	{
		super.reset(X, Y);
	}
	
}