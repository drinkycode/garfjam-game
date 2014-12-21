package com.ludoko.garfjam;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	
	public var head:FlxSprite;
	public var subtitle:FlxSprite;
	public var copyright:FlxSprite;
	public var pressStart:FlxSprite;
	
	private var _headSize:Float = 0;
	private var _headAngle:Float = 0;
	
	private var _pressStartX:Float = 0;
	private var _pressStartY:Float = 0;
	private var _pressStartCos:Float = 0;
	private var _pressStartSin:Float = 0;
	
	override public function create():Void
	{
		super.create();
		
		G.init();
		
		#if flash
		FlxG.mouse.useSystemCursor = true;
		#end
		
		var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/bg.jpg");
		add(bg);
		
		pressStart = new FlxSprite(G.halfWidth - 116, FlxG.height - 112, "assets/images/start_game.png");
		add(pressStart);
		_pressStartX = pressStart.x;
		_pressStartY = pressStart.y;
		
		head = new FlxSprite(G.halfWidth - 400, G.halfHeight - 392, "assets/images/garfield-mask.png");
		head.antialiasing = false;
		add(head);
		
		_headSize = 0.0333;
		_headAngle = FlxRandom.float() * 25;
		
		var title:FlxSprite = new FlxSprite(G.halfWidth - 364, 53);
		title.loadGraphic("assets/images/title.png", true, 728, 104);
		title.animation.add("idle", [0, 1], 3, true);
		title.animation.play("idle");
		add(title);
		
		subtitle = new FlxSprite(G.halfWidth - 444, 196, "assets/images/subtitle.png");
		subtitle.alpha = 0.3;
		add(subtitle);
		
		copyright = new FlxSprite(G.halfWidth - 364, 53, "assets/images/copyright.jpg");
		add(copyright);
		
		copyright.x = -FlxRandom.intRanged(32, 64) - 585;
		copyright.y = FlxRandom.intRanged(FlxG.height - 128, FlxG.height - 22);
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
		if (FlxG.keys.anyJustPressed(["A"]))
		{
			
		}
		
		super.update();
		
		var elapsed:Float = FlxG.elapsed;
		
		_pressStartCos += elapsed * 5;
		_pressStartSin += elapsed * 3;
		pressStart.x = Math.sin(_pressStartCos) * 16 + _pressStartX;
		pressStart.y = Math.sin(_pressStartSin) * 12 + _pressStartY;
		
		_headSize += elapsed * 0.025;
		//_headSize += elapsed * 0.00667;
		_headAngle += elapsed * 3.333;
		
		head.scale.x = head.scale.y = _headSize;
		head.angle = _headAngle;
		
		subtitle.alpha = FlxRandom.float() * 0.222;
		
		copyright.x += elapsed * 32;
		if (copyright.x > FlxG.width)
		{
			copyright.x = -FlxRandom.intRanged(32, 64) - 585;
			copyright.y = FlxRandom.intRanged(FlxG.height - 128, FlxG.height - 22);
		}
	}	
}