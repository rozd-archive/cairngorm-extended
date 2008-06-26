package org.cairngorm.extended.control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import org.cairngorm.extended.commands.MultiCommand;

	public class FrontControllerExtended extends FrontController
	{
		public function FrontControllerExtended()
		{
			super();
			
			this.addCommand(MultiCommandEvent.MULTICOMMAND_NAME, MultiCommand);
		}
		
	}
}