package org.cairngorm.extended.control
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import org.cairngorm.extended.commands.MultiCommandMode;

	public class MultiCommandEvent extends CairngormEvent
	{
		public static const MULTICOMMAND_NAME:String	= "executeMultiCommand";
		
		public var mode:int;
		public var events:Array;
		
		public function MultiCommandEvent(events:Array, 
										  mode:int=MultiCommandMode.SEQUENCE)
		{
			super(MULTICOMMAND_NAME);
			
			this.mode = mode;
			this.events = events;
		}
		
		override public function clone():Event
		{
			return new MultiCommandEvent(this.events, this.mode);
		}
	}
}