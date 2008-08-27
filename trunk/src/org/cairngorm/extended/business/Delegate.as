package org.cairngorm.extended.business
{
	import mx.rpc.IResponder;
	
	import org.cairngorm.extended.commands.CallbackCommand;
	import org.cairngorm.extended.events.CallbackPrioritiy;

	public class Delegate implements IResponder
	{
		private var responder:IResponder;
		
		public function Delegate(responder:IResponder)
		{
			this.responder = responder;
		}

		public function result(data:Object):void
		{
			if (this.responder is CallbackCommand)
			{
				var command:CallbackCommand = CallbackCommand(this.responder);
				
				if (!command.callback)
				{
					this.responder.result(data);
					
					return;
				}
				
				switch (command.callback.priority)
				{
					case CallbackPrioritiy.AFTER :
					{
						command.result(data);
						command.callback.result(data);
					}
					break;
					case CallbackPrioritiy.BEFORE :
					{
						command.callback.result(data);
						command.result(data);
					}
					break;
					case CallbackPrioritiy.OVERRIDE :
					{
						command.callback.result(data);
					}
					break;
					default :
					{
						command.result(data);
						command.callback.result(data);
					}
					break;
				}
			}
			else
			{
				this.responder.result(data);
			}
		}
		
		public function fault(info:Object):void
		{
			if (this.responder is CallbackCommand)
			{
				var command:CallbackCommand = CallbackCommand(this.responder);
				
				if (!command.callback)
				{
					this.responder.fault(info);
					
					return;
				}
				
				switch (command.callback.priority)
				{
					case CallbackPrioritiy.AFTER :
					{
						command.fault(info);
						command.callback.fault(info);
					}
					break;
					case CallbackPrioritiy.BEFORE :
					{
						command.callback.fault(info);
						command.fault(info);
					}
					break;
					case CallbackPrioritiy.OVERRIDE :
					{
						command.callback.fault(info);
					}
					break;
					default :
					{
						command.fault(info);
						command.callback.fault(info);
					}
					break;
				}
			}
			else
			{
				this.responder.fault(info);
			}
		}
		
	}
}