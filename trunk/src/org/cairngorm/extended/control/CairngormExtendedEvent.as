package org.cairngorm.extended.control
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
	import org.cairngorm.extended.events.Callback;

	public class CairngormExtendedEvent extends CairngormEvent
	{
		// ----------------- STATIC FIELDS ---------------- //

		

		// ---------------- PRIVATE FIELDS ---------------- //

		private var _events:Array;
		
		private var _callback:Callback;

		// ------------------ CONSTRUCTOR ----------------- //

		

		// ----------------- PUBLIC FIEDS ----------------- //
		
		public function get events():Array
		{
			return this._events;
		}
		public function set events(value:Array):void
		{
			this._events = value;
		}
		
		public function get callback():Callback
		{
			return this._callback;
		}
		public function set callback(value:Callback):void
		{
			this._callback = value;
		}
		
		// --------------- PROTECTED FIELDS --------------- //

		

		// ---------------- PUBLIC METHODS ---------------- //

		

		// --------------- PROTECTED METHODS -------------- //

		

		// ---------------- PRIVATE METHODS --------------- //

		

		// ------------------- HANDLERS ------------------- //

		

		// --------------- USER INTERACTION --------------- //


		public function CairngormExtendedEvent(type:String, 
											   events:Array=null, 
											   callback:Callback=null,
											   bubbles:Boolean=false, 
											   cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.events = events;
			this.callback = callback;
		}
		
		override public function clone():Event
		{
			return new CairngormExtendedEvent(this.type, 
											  this.events,
											  this.callback,
											  this.bubbles, 
											  this.cancelable);
		}
	}
}