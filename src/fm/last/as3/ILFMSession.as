package fm.last.as3 {import flash.net.URLLoader;/** * The ILFMSession interface defines the property and methods for making * calls to last.fm services. */public interface ILFMSession {	/**	 * Make not authenticated calls.	 * @param variables contains parameters for call.	 * @return loader made call.	 */	function call(variables:Object):URLLoader;	/**	 * Make authenticated calls.	 * @param variables contains parameters for call.	 * @return loader made call.	 */	function authenticatedCall(variables:Object):URLLoader;	/**	 * Session key for authorized access to user account.	 */	function get sessionKey():String;	function set sessionKey(value:String):void;}}