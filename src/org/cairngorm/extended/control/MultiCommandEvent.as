package org.cairngorm.extended.control
{
	import flash.events.Event;
	
	import org.cairngorm.extended.commands.MultiCommandMode;

	public class MultiCommandEvent extends CairngormExtendedEvent
	{
		public static const MULTICOMMAND_NAME:String	= "executeMultiCommand";
		
		public var mode:int;
		
		public function MultiCommandEvent(events:Array, 
										  mode:int=MultiCommandMode.SEQUENCE)
		{
			super(MULTICOMMAND_NAME, events);
			
			this.mode = mode;
		}
		
		public function addEvent(event:CairngormExtendedEvent):void
		{
			this.events.push(event);
		}
		
		override public function clone():Event
		{
			return new MultiCommandEvent(this.events, this.mode);
		}
	}
}