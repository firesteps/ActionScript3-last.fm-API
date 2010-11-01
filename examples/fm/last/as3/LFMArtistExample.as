package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	
	import fm.last.as3.ILFMSession;
	import fm.last.as3.LFMArtist;
	import fm.last.as3.LFMSession;

	public class LFMArtistExample extends Sprite{
		private var _session:ILFMSession;
		
		public function LFMArtistExample(){
			_session = new LFMSession('b25b959554ed76058ac220b7b2e0a026');
			var artist:LFMArtist = new LFMArtist(_session);
			
			addListeners(artist.getEvents('Cher'));
			addListeners(artist.getImages('Cher'));//TODO: wtf???
			addListeners(artist.getInfo('Cher'));
			addListeners(artist.getPastEvents('Cher'));
			addListeners(artist.getPodcast('Cher'));
			addListeners(artist.getShouts('Cher'));
			addListeners(artist.getSimilar('Cher'));
			addListeners(artist.getTopAlbums('Cher'));
			addListeners(artist.getTopFans('Cher'));
			addListeners(artist.getTopTags('Cher'));
			addListeners(artist.getTopTracks('Cher'));
			
			// if you haven't authorized session, this requests will throw service errors 

			addListeners(artist.addTags('Cher', 'someTag'));
			addListeners(artist.getTags('Cher'));
			addListeners(artist.removeTag('Cher', 'someTag'));
			addListeners(artist.search('Cher'));
			addListeners(artist.share('Cher','some@email'));
			addListeners(artist.shout('Cher', 'use as3 api framework'));
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