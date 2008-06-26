package org.cairngorm.extended.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.cairngorm.extended.control.CairngormExtendedEvent;
	import org.cairngorm.extended.control.MultiCommandEvent;

	public class MultiCommand implements ICommand
	{
		public function MultiCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var e:MultiCommandEvent = MultiCommandEvent(event);
			
			if (!e.events || e.events.length == 0)
				return;
			
			switch (e.mode)
			{
				case MultiCommandMode.SEQUENCE :
					
					var startEvent:CairngormExtendedEvent = 
						CairngormExtendedEvent(e.events.shift());
					
					if (e.events.length > 0)
					{
						startEvent.events = startEvent.events || [];
						startEvent.events = startEvent.events.concat(e.events);
					}
					
					startEvent.dispatch();
					
				break;
				
				case MultiCommandMode.PARALLEL :
					
					var n:int = e.events.length;
					for (var i:int; i<n; i++)
					{
						CairngormExtendedEvent(e.events[i]).dispatch();
					}
					
				break;
			}
		}
		
	}
}