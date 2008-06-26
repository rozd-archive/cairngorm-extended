package org.cairngorm.extended.commands
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	import org.cairngorm.extended.control.CairngormExtendedEvent;
	import org.cairngorm.extended.events.Callback;

	public class CallbackCommand extends Command implements IResponder
	{
		protected var callback:Callback;
		
		public function CallbackCommand()
		{
			super();
		}
		
		override public function execute(event:CairngormEvent):void
		{
			super.execute(event);
			
			var e:CairngormExtendedEvent = CairngormExtendedEvent(event);
			
			this.callback = e.callback;
		}
		
		public function result(data:Object):void
		{
			if (this.callback)
				this.callback.result(data);
		}
		
		public function fault(info:Object):void
		{
			if (this.callback)
				this.callback.fault(info);
		}
	}
}