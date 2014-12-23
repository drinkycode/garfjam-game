package com.ludoko.garfjam;

import flixel.FlxSprite;

/**
 * ...
 * @author Michael Lee
 */
class HallucSprite extends FlxSprite
{
	
	public var hAlphaMult:Float = 0.5;
	public var hIncrements:Int = 6;

	public function new(X:Float = 0, Y:Float = 0, SimpleGraphic:Dynamic = null) 
	{
		super(X, Y, SimpleGraphic);
	}
	
	override public function draw():Void 
	{
		var ox:Float = x;
		var oy:Float = y;
		var oalpha:Float = alpha;
		alpha = alpha * hAlphaMult;
		
		super.draw();
		
		var ad:Float = alpha / (hIncrements + 1);
		
		for (i in 0 ... hIncrements)
		{
			alpha -= ad;
			
			var d:Float = (i + 2) * (i + 4);
			x += G.cos * d;
			y += G.sin * d;
			
			super.draw();
		}
		
		x = ox;
		y = oy;
		alpha = oalpha;
	}
	
}