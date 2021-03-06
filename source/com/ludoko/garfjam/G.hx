package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class G
{
	
	public static var halfWidth:Int;
	public static var halfHeight:Int;
	
	public static var angle:Float = 0;
	public static var cos:Float = 0;
	public static var sin:Float = 0;
	
	private static var _initialized:Bool = false;
	
	public static function init():Void
	{
		if (_initialized) return;
		_initialized = true;
		
		halfWidth = Math.floor(FlxG.width * 0.5);
		halfHeight = Math.floor(FlxG.height * 0.5);
	}
	
	public static var levels:Array<Dynamic> = [];
	public static var level:Int = 0;
	
	public static var scores:Array<Dynamic> = [];
	public static var score:Int = 0;
	
	public static var saves:Array<FlxSave> = [];
	
}