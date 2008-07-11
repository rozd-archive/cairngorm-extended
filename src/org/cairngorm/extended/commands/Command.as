package org.cairngorm.extended.commands
{
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.cairngorm.extended.control.CairngormExtendedEvent;

	public class Command extends SequenceCommand
	{
		private var event:CairngormExtendedEvent;
		
		public function Command()
		{
			super();
		}
		
		override public function execute(event:CairngormEvent):void
		{
			this.event = CairngormExtendedEvent(event);
		}
		
		override public function executeNextCommand():void
		{
			if (this.event.events && this.event.events.length > 0)
			{
				var nextEvent:CairngormExtendedEvent = 
					this.nextEvent ? 
					CairngormExtendedEvent(this.nextEvent) : 
					CairngormExtendedEvent(this.event.events.shift());
				
				if (this.event.events.length > 0)
				{
					nextEvent.events = nextEvent.events || [];
					nextEvent.events = nextEvent.events.concat(this.event.events);
				}
				
				this.nextEvent = nextEvent;
			}
			
			super.executeNextCommand();
		}
	}
}