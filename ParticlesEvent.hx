package;

import flash.geom.Point;

/**
 * ...
 * @author Henry D. Fernández B.
 */

class ParticlesEvent extends GameEvent
{
	public static inline var TYPE : String = "ParticlesEvent";
	
	var layer : String;
	var names : Array<String>;
	var number : Int;
	var pos : Point;
	var size : Float;
	var direction : String;
	var vel : Point;
	var colors : Array<Color>;
	var time : Float;
	var acc : Point;
	var disappear : Bool;
	var action : String;
	
	public function new(layer : String, names : Array<String>,number : Int,pos : Point,size : Float,direction : String,vel : Point,acc : Point, colors : Array<Color>,time : Float = 0,disappear : Bool = true, action : String = "all", bubbles:Bool=false, cancelable:Bool=false) 
	{
		super(TYPE,"",bubbles, cancelable);
		
		this.layer = layer;
		this.names = names;
		this.number = number;
		this.pos = pos;
		this.size = size;
		this.direction = direction;
		this.vel = vel;
		this.acc = acc;
		this.colors = colors;
		this.time = time;
		this.disappear = disappear;
		this.action = action;
	}
	
	public function GetLayer() : String
	{
		return layer;
	}
	
	public function GetNames() : Array<String>
	{
		return names;
	}
	
	public function GetNumber() : Int
	{
		return number;
	}
	
	public function GetPos() : Point
	{
		return pos;
	}
	
	public function GetSize() : Float
	{
		return size;
	}
	
	public function GetDirection() : String
	{
		return direction;
	}
	
	public function GetVel() : Point
	{
		return vel;
	}
	
	public function GetColors() : Array<Color>
	{
		return colors;
	}
	
	public function GetTime() : Float
	{
		return time;
	}
	
	public function GetAcc() : Point
	{
		return acc;
	}
	
	public function GetDisappear() : Bool
	{
		return disappear;
	}
	
	public function GetAction() : String
	{
		return action;
	}
}