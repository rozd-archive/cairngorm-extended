package org.cairngorm.extended.events
{
	import mx.rpc.IResponder;

	public class Callback implements IResponder
	{
		// ----------------- STATIC FIELDS ---------------- //

		

		// ---------------- PRIVATE FIELDS ---------------- //

		private var resultHandler:Function;
		
		private var faultHandler:Function;

		// ------------------ CONSTRUCTOR ----------------- //

		public function Callback(result:Function=null, 
								 fault:Function=null, 
								 priority:int=CallbackPrioritiy.AFTER)
		{
			this.resultHandler = result;
			this.faultHandler = fault;
			this.priority = priority;
		}

		// ----------------- PUBLIC FIEDS ----------------- //

		public var priority:int;

		// --------------- PROTECTED FIELDS --------------- //

		

		// ---------------- PUBLIC METHODS ---------------- //

		public function result(data:Object):void
		{
			if (this.resultHandler != null)
				this.resultHandler(data);
		}
		
		public function fault(info:Object):void
		{
			if (this.faultHandler != null)
				this.faultHandler(info);
		}

		// --------------- PROTECTED METHODS -------------- //

		

		// ---------------- PRIVATE METHODS --------------- //

		

		// ------------------- HANDLERS ------------------- //

		

		// --------------- USER INTERACTION --------------- //

		
	}
}