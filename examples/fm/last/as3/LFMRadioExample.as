package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	
	import fm.last.as3.ILFMSession;
	import fm.last.as3.LFMRadio;
	import fm.last.as3.LFMSession;
	
	public class LFMRadioExample extends Sprite{
		private var _session:ILFMSession;
		public function LFMRadioExample(){
			super();
			_session = new LFMSession('b25b959554ed76058ac220b7b2e0a026');
			var radio:LFMRadio= new LFMRadio(_session);
			
			// Any API account can only stream radio to Last.fm's paid subscribers.
			// Note: Due to licensing restrictions, you may not use the radio API on mobile telephones.
			// 19.8.2010
			// see http://www.last.fm/api/radio for station url
			var loader:URLLoader = radio.tune('lastfm://artist/moby/similarartists');
			addListeners(loader);
			loader.addEventListener(Event.COMPLETE, onRadioTune);
		}
		
		private function onRadioTune(event:Event):void{
			addListeners(new LFMRadio(_session).getPlaylist());
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