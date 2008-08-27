package org.cairngorm.extended.commands
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	
	import org.cairngorm.extended.control.CairngormExtendedEvent;
	import org.cairngorm.extended.events.Callback;

	public class CallbackCommand extends Command implements IResponder
	{
		private var _callback:Callback;
		
		public function CallbackCommand()
		{
			super();
		}
		
		public function get callback():Callback
		{
			return this._callback;
		}
		
		override public function execute(event:CairngormEvent):void
		{
			super.execute(event);
			
			var e:CairngormExtendedEvent = CairngormExtendedEvent(event);
			
			this._callback = e.callback;
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