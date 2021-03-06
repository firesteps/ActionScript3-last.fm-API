package{
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	
	import fm.last.as3.LFMAlbum;
	import fm.last.as3.LFMSession;
		
	public class LFMAlbumExample extends Sprite{
		private var _session:LFMSession;
		
		public function LFMAlbumExample(){
			_session = new LFMSession('b25b959554ed76058ac220b7b2e0a026');
			var album:LFMAlbum = new LFMAlbum(_session);

			addListeners(album.getBuylinks('radiohead', 'in rainbows', null, 'united kingdom'));
			addListeners(album.getInfo('Cher','Believe'));
			addListeners(album.getTopTags('Cher', 'Believe'));
			addListeners(album.search('Believe'));

			// if you haven't authorized session, this requests will throw service errors 
			
			addListeners(album.addTags('Cher', 'Believe', 'some tag'));
			addListeners(album.getTags('Cher', 'Believe'));
			addListeners(album.removeTag('Cher', 'Believe', 'some tag'));
			addListeners(album.share('Cher','Believe', 'some@email', 'message'));
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