package org.cairngorm.extended.commands
{
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.cairngorm.extended.control.CairngormExtendedEvent;

	public class Command extends SequenceCommand
	{
		protected var event:CairngormExtendedEvent;
		
		public function Command()
		{
			super();
		}
		
		override public function execute(event:CairngormEvent):void
		{
			var e:CairngormExtendedEvent = CairngormExtendedEvent(event);
			
			if (!e.events || e.events.length == 0)
				return;
			
			var nextEvent:CairngormExtendedEvent = 
					CairngormExtendedEvent(e.events.shift());
			
			if (e.events.length > 0)
			{
				nextEvent.events = nextEvent.events || [];
				nextEvent.events = nextEvent.events.concat(e.events);
			}
			
			this.nextEvent = nextEvent;
		}
	}
}