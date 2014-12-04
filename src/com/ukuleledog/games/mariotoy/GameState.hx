package com.ukuleledog.games.mariotoy;

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import motion.Actuate;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.media.Sound;

/**
 * ...
 * @author Matt
 */
class GameState extends Sprite
{

	private var sound:Sound;
	private var mario1:Bitmap;
	private var mario2:Bitmap;
	private var mario3:Bitmap;
	private var burger:Bitmap;
	private var burgerContainer:Sprite;
	private var emma:Bitmap;
	
	public function new() 
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
		
		burger = new Bitmap( Assets.getBitmapData('img/burger.png') );
		burgerContainer = new Sprite();
		burger.x -= burger.width / 2;
		burger.y -= burger.height / 2;
		burgerContainer.addChild( burger );
		
		mario1 = new Bitmap( Assets.getBitmapData('img/mario1.png') );
		mario2 = new Bitmap( Assets.getBitmapData('img/mario2.png') );
		mario3 = new Bitmap( Assets.getBitmapData('img/mario3.png') );
		emma = new Bitmap( Assets.getBitmapData('img/emma.jpg') );
		sound = Assets.getSound('snd/inception.mp3');
		
	}
	
	private function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		
		sound.play();
		mario1.height = stage.stageHeight;
		mario1.scaleX = mario1.scaleX;
		mario1.x = (stage.stageWidth / 2) - (mario1.width / 2);
		addChild( mario1 );
		Actuate.tween( mario1, 4, { 'alpha':0 } ).onComplete( function() {
			
			removeChild( mario1 );
			sound.play();
			mario2.height = stage.stageHeight;
			mario2.scaleX = mario2.scaleX;
			mario2.x = (stage.stageWidth / 2) - (mario2.width / 2);
			addChild( mario2 );
			
			Actuate.tween( mario2, 4, { 'alpha':0 } ).onComplete( function() {
			
				removeChild( mario2 );
				sound.play();
				mario3.height = stage.stageHeight;
				mario3.scaleX = mario3.scaleX;
				mario3.x = (stage.stageWidth / 2) - (mario3.width / 2);
				addChild( mario3 );
				
				Actuate.tween( mario3, 4, { 'alpha':0 } ).onComplete( function() {
					
					removeChild( mario3 );
					sound.play();
					burgerContainer.x = stage.stageWidth / 2;
					burgerContainer.y = stage.stageHeight / 2;
					addChild( burgerContainer );
					
					Actuate.tween( burgerContainer, 6, { 'scaleX':1.5, 'scaleY': 1.5, 'alpha':0 } ).onComplete( function() {
						sound.play();
						removeChild( burgerContainer );
						emma.width = stage.stageWidth;
						emma.scaleY = emma.scaleX;
						emma.y = (stage.stageHeight / 2) - (emma.height / 2);
						addChild( emma );
						
						Actuate.tween( emma, 5, { 'alpha':0 } ).onComplete( function() { trace('prout'); } );
						
					} );
					
				} );
				
			} );
			
		} );
	}
	
}