package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouse;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

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
		super.update();
	}	
}