package org.cairngorm.extended.business
{
	import com.adobe.cairngorm.business.IServiceLocator;
	
	import flash.utils.describeType;
	
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;
	import mx.rpc.soap.WebService;

	public class ServiceLocator extends com.adobe.cairngorm.business.ServiceLocator
	{
		private static var instance:ServiceLocator;
		
		public function ServiceLocator()
		{
			super();
		}
		
		/**
		 * Return the ServiceLocator instance.
		 * @return the instance.
		 */
		public static function getInstance():ServiceLocator 
		{
			if (instance == null)
			{
				instance = new ServiceLocator();
			}
			
			return instance;
		}
		
		private var _destination:String;
		[Bindable]
		public function get destination():String
		{
			return this._destination;
		}
		public function set destination(value:String):void
		{
			this._destination = value;
			
			var accessors:XMLList = this.getAccessors(this);
         
			for (var i:int; i < accessors.length(); i++)
			{
				var name:String = accessors[i];
				var object:Object = this[name];
				
				if (object is RemoteObject)
					RemoteObject(object).destination = this.destination;
				else if (object is WebService)
					WebService(object).destination = this.destination;
				else if (object is HTTPService)
					HTTPService(object).destination = this.destination;
			}
		}
		
		protected function getAccessors(serviceLocator:IServiceLocator):XMLList
		{
			var description:XML = describeType(serviceLocator);
			var accessors:XMLList = description.accessor.(@access == "readwrite").@name;
			
			return accessors;
		}
	}
}