package;

import aze.display.TileLayer;
import aze.display.TileSprite;
import flash.geom.Point;

/**
 * ...
 * @author Henry D. Fernández B.
 */
class Particle extends TileSprite
{
	var velocity : Point;
	var acceleration : Point;
	var timer : Float;
	var maxTime : Float;
	var isDead : Bool;
	var partScale : Float;
	var partAlpha : Float;
	var partRotation : Float;
	var initialScale : Float;
	var initialAlpha : Float;
	var disappear : Bool;
	var action : String;
	
	public function new(tileLayer : TileLayer,name : String,pos : Point, vel : Point, acc : Point, scale : Float, rot : Float, alpha : Float, time : Float,  color : Color, disappear : Bool = true, action : String = "all") 
	{
		super(tileLayer,name);
		
		this.maxTime = time;
		this.velocity = GraphicManager.FixPoint2Screen(vel);
		this.acceleration = GraphicManager.FixPoint2Screen(acc);
		this.disappear = disappear;
		this.action = action;
		x = pos.x;
		y = pos.y;
		initialScale = scale * GraphicManager.GetFixScale();
		initialAlpha = alpha;
		partScale = scale * GraphicManager.GetFixScale();
		partAlpha = alpha;
		partRotation = rot;
		r = color.r;
		g = color.g;
		b = color.b;
		this.alpha = partAlpha;
		this.scale = partScale;
		this.rotation = partRotation;
		timer = 0;
		
	}
	
	public function Update(gameTime:Float):Void 
	{
		UpdateVelocity();
		UpdatePosition();

		if (timer >= MathHelper.ConvertSecToMillisec(maxTime))
		{
			isDead = true;
		}
		else
		{
			if (action == "all")
			{
				UpdateAlpha();
				UpdateScale();
				UpdateRotation();
			}
			
			timer += gameTime;
		}
		
		if(disappear)
			alpha = partAlpha;
		else
			alpha = 1;
			
		scale = partScale;
		rotation = partRotation;
	}
	
	private function UpdateVelocity() : Void
	{
		velocity.x += acceleration.x;
		velocity.y += acceleration.y;
	}
	
	private function UpdatePosition() : Void
	{
		x += velocity.x;
		y += velocity.y;
	}
	
	private function UpdateRotation() : Void
	{}
	
	private function UpdateAlpha() : Void
	{
		partAlpha = initialAlpha * (1 - (timer/MathHelper.ConvertSecToMillisec(maxTime)));
	}
	
	private function UpdateScale() : Void
	{
		partScale = initialScale * (1 - (timer/MathHelper.ConvertSecToMillisec(maxTime)));
	}
	
	public function IsDead() : Bool
	{
		return isDead;
	}
}