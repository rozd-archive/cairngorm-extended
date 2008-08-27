package org.cairngorm.extended.control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	import org.cairngorm.extended.commands.Command;
	import org.cairngorm.extended.commands.MultiCommand;

	public class FrontControllerExtended extends FrontController
	{
		//----------------------------------------------------------------------
		//
		//	Static fields
		//
		//----------------------------------------------------------------------
		
		/**
		 * Dictionary for storing describeType results of commands
		 */
		private static const descriptions:Dictionary = new Dictionary(true);
		
		/**
		 * Type of base class for commands.
		 * 
		 * All commands must extends of CairngormExtended Command class.
		 */
		private static const type:String = getQualifiedClassName(Command);
		
		//----------------------------------------------------------------------
		//
		//	Private fields
		//
		//----------------------------------------------------------------------
		
		public function FrontControllerExtended()
		{
			super();
			
			this.addCommand(MultiCommandEvent.MULTICOMMAND_NAME, MultiCommand);
		}
		
		override public function addCommand(commandName:String, commandRef:Class, useWeakReference:Boolean=true):void
		{
			if (!commandName || !commandRef)
				throw new Error("The 'commandName' and 'commandRef' cannot be null.");
			
			var info:XML = descriptions[commandRef];
			
			if (!info)
				info = descriptions[commandRef] = describeType(commandRef);
			
			if (info.factory.extendsClass.(@type == type).length == 0)
				throw new Error("The commandRef must be extended of org.cairngorm.extended.commands.Command");
			
			super.addCommand(commandName, commandRef, useWeakReference);
		}
		
	}
}