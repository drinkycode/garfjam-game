package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.tweens.misc.AngleTween;

/**
 * ...
 * @author Michael Lee
 */
class Garfield extends FlxSprite
{

	public var shadow:FlxSprite;
	
	private var _laserCooldown:Float = 0;
	
	public function new() 
	{
		super(G.halfWidth - 32, G.halfHeight - 44);
		
		maxVelocity.x = 100;
		maxVelocity.y = 60;
		drag.x = 1000;
		drag.y = 800;
		
		loadGraphic("assets/images/garfield.png", true, 64, 88);
		setFacingFlip(FlxObject.LEFT, true, false);
		setFacingFlip(FlxObject.RIGHT, false, false);
		animation.add("idle", [0], 10, true);
		
		animation.play("idle");
		
		shadow = new FlxSprite(x + 3, y + 71, "assets/images/garfield_shadow.png"); 
	}
	
	override public function update():Void 
	{
		var elapsed:Float = FlxG.elapsed;
		
		acceleration.x = acceleration.y = 0;
		
		if (FlxG.keys.anyPressed(["LEFT"]))
		{
			acceleration.x = -600;
			facing = FlxObject.LEFT;
		}
		else if (FlxG.keys.anyPressed(["RIGHT"]))
		{
			acceleration.x = 600;
			facing = FlxObject.RIGHT;
		}
		
		if (FlxG.keys.anyPressed(["UP"]))
		{
			acceleration.y = -400;
		}
		else if (FlxG.keys.anyPressed(["DOWN"]))
		{
			acceleration.y = 400;
		}
		
		if (FlxG.keys.anyPressed(["X"]))
		{
			if (_laserCooldown <= 0)
			{
				Laser.create(x + 32, y + 19, facing);
				_laserCooldown = 0.9;
			}
		}
		
		super.update();
		shadow.x = x + 3;
		shadow.y = y + 71;
		
		_laserCooldown -= elapsed;
	}
	
	override public function draw():Void 
	{
		var ox:Float = x;
		var oy:Float = y;
		var oalpha:Float = alpha;
		alpha = alpha * 0.5;
		
		super.draw();
		
		var inc:Int = 6;
		var ad:Float = alpha / (inc + 1);
		
		for (i in 0 ... inc)
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