package com.ludoko.garfjam;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */
class GameGUI extends FlxGroup
{
	
	public var score:FlxSprite;
	
	public var food:FlxSprite;
	public var foodBar:FoodBar;
	
	public function new() 
	{
		super();
		
		score = new FlxSprite(34, 32, "assets/images/text_score.png");
		
		food = new FlxSprite(34, FlxG.height - 96, "assets/images/text_food.png");
		foodBar = new FoodBar();
		
		add(score);
		add(food);
		add(foodBar);
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
}