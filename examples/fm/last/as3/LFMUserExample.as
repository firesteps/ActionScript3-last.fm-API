package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	
	import fm.last.as3.ILFMSession;
	import fm.last.as3.LFMSession;
	import fm.last.as3.LFMUser;
	
	public class LFMUserExample extends Sprite{
		private var _session:ILFMSession;
		public function LFMUserExample(){
			super();
			_session = new LFMSession('b25b959554ed76058ac220b7b2e0a026');
			var user:LFMUser = new LFMUser(_session);
			
			addListeners(user.getArtistTracks('firesteps', 'Moby'));
			addListeners(user.getEvents('firesteps'));
			addListeners(user.getFriends('rj'));
			addListeners(user.getInfo('rj'));
			addListeners(user.getLovedTracks('rj'));
			addListeners(user.getShouts('rj'));
			addListeners(user.getTopTags('rj'));
			addListeners(user.getWeeklyTrackChart('rj'));
			// if you haven't authorized session, this requests will throw errors 			
			addListeners(user.getRecentStations('rj'));
			addListeners(user.shout('rj','message'));
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