package com.ludoko.garfjam;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouse;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAngle;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	public static var instance:PlayState;
	
	public var garfield:Garfield;
	public var odies:FlxGroup;
	public var bg:FlxSprite;
	public var bgObjects:FlxGroup;
	public var lasers:FlxGroup;
	public var lasagnas:FlxGroup;
	public var gui:GameGUI;
	
	private var _lasagnaTimer:Float = 0;
	private var _lasagnaCooldown:Float = 5;
	
	public function new()
	{
		super();
		instance = this;
	}
	
	override public function create():Void
	{
		super.create();
		
		G.init();
		
		#if flash
		FlxG.mouse.useSystemCursor = true;
		#end
		
		var s:FlxSprite;
		
		garfield = new Garfield();
		
		bgObjects = new FlxGroup();
		switch (G.level) 
		{
			case 0:
				bg = new FlxSprite(0, 0, "assets/images/bg_livingroom.jpg");
				
				
			case 1:
				
			case 2:
				
			default:
				bg = new FlxSprite(0, 0, "assets/images/bg_livingroom.jpg");
				
		}
		
		lasers = new FlxGroup();
		Laser._group = lasers;
		
		lasagnas = new FlxGroup();
		Lasagna._group = lasagnas;
		
		gui = new GameGUI();
		
		add(bg);
		add(bgObjects);
		add(garfield.shadow);
		add(garfield);
		add(lasagnas);
		add(lasers);
		add(gui);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		var elapsed:Float = FlxG.elapsed;
		
		_lasagnaTimer -= elapsed;
		if (_lasagnaTimer <= 0)
		{
			Lasagna.create(FlxRandom.intRanged(64, FlxG.width - 64), FlxRandom.intRanged(64, FlxG.height - 64));
			_lasagnaTimer += _lasagnaCooldown;
		}
		
		super.update();
		
		FlxG.overlap(garfield, lasagnas, garfieldEatsLasagna);
	}
	
	private function garfieldEatsLasagna(Garf:FlxBasic, Lasag:FlxBasic):Void
	{
		Lasag.kill();
		gui.foodBar.amount += 200;
	}
	
	
	override public function draw():Void 
	{
		G.angle += FlxG.elapsed * 180;
		var r:Float = FlxAngle.asRadians(G.angle);
		G.cos = Math.cos(r);
		G.sin = Math.sin(r);
		
		super.draw();
	}
}