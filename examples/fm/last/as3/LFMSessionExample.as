package{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import fm.last.as3.ILFMSession;
	import fm.last.as3.LFMSession;
	
	public class LFMSessionExample extends Sprite{
		private var _session:LFMSession;
		public function LFMSessionExample(){
			super();
			_session = new LFMSession('your api key', 'your secret');
			
			
			// now you can call services without authentication 
			// (secret needs only for authorized calls)
			// for example if you use authentication for desktop applications
			var loader:URLLoader = _session.getToken();
			addListeners(loader);
			loader.addEventListener(Event.COMPLETE, onGetToken);
			
			
			// or if you use authentication for web applications and already have
			// authorized token just
			getSession('token from GET variable');
			
			
			// or if you use authentication for mobile applications just
			// ask for username and password :)
			addListeners(_session.getMobileSession('userName', 'password'));
		}
		
		public function getSession(token:String):void{
			addListeners(_session.getSession(token));
		}
		
		private function onGetToken(event:Event):void{
			var token:String = (event.target.data as XML).token; 
			// after receiving token redirect user to last.fm/auth
			navigateToURL(new URLRequest(_session.getRedirectLink(token)));
			
			
			// when user grant permission to use account you can 
			getSession(token);
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
