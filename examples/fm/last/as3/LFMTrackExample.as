package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	
	import fm.last.as3.ILFMSession;
	import fm.last.as3.LFMSession;
	import fm.last.as3.LFMTrack;
	
	public class LFMTrackExample extends Sprite	{
		private var _session:ILFMSession;
		public function LFMTrackExample(){
			super();
			_session = new LFMSession('b25b959554ed76058ac220b7b2e0a026');
			var track:LFMTrack = new LFMTrack(_session);
			
			addListeners(track.getBuylinks('Cher','Believe'));
			addListeners(track.getFingerprintMetadata('1234'));
			addListeners(track.getInfo('Cher'));
			addListeners(track.getSimilar('Cher'));
			addListeners(track.search('Believe'));
			addListeners(track.share('Moby','Run On','someuser'));
			// if you haven't authorized session, this requests will throw errors 
			addListeners(track.addTags('Moby', 'Run On', 'sometag'));
			addListeners(track.ban('Cher', 'Believe'));
			addListeners(track.love('Moby', 'Run On'));
			addListeners(track.removeTag('Moby', 'Run On', 'sometag'));
		}

		private function addListeners(loader:URLLoader):void{
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		
		private function removeListeners(loader:URLLoader):void{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		
		private function onComplete(event:Event):void{
			trace(new XML((event.target as URLLoader).data).toXMLString());
			removeListeners(event.target as URLLoader);
		}
		
		private function onHttpStatus(event:HTTPStatusEvent):void{
			trace('http status: ' + event.status);
		}
		
		private function onSecurityError(event:SecurityErrorEvent):void{
			trace('security error');
			removeListeners(event.target as URLLoader);
		}
		
		private function onIOError(event:IOErrorEvent):void{
			var message:XML = new XML(event.target.data);
			trace('IO error, error code: ' + message.error.@code + 
				' error message: ' + message.error );
			removeListeners(event.target as URLLoader);
		}
	}
}