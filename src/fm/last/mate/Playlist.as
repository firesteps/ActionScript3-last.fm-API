/* Copyright (c) 2010 Omar Valiev Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. @ignore */package fm.last.mate {import com.asfusion.mate.actionLists.IScope;import fm.last.as3.LFMPlaylist;/** * <code>Playlist</code> tag send request to last.fm service. * * <p>If you whant set property using SmartObject use <code>&lt;Properties /&gt;</code> tag * (except session property).</p> * * <p>See <code>LFMPlaylist</code> class for information about methods and arguments.</p> * * @example using Playlist tag in &lt;EventHandlers /&gt;. * <listing version="3.0"> * &lt;EventHandlers type="{PlaylistEvent.GET_FETCH}"&gt; *		&lt;lfm:Playlist method="fetch" session="{event.session}"&gt; *			&lt;Properties event="{event.playlistURL}" /&gt; *			&lt;lfm:resultHandlers&gt; *				&lt;MethodInvoker generator="{AppController}" method="fetchPlaylist" *				                  arguments="{[event.playlistURL, resultObject]}" /&gt; *			&lt;/lfm:resultHandlers&gt; *          &lt;lfm:faultHandlers&gt; *              &lt;MethodInvoker generator="{AppController}" method="faultHandler" *                                arguments="{[fault]}" /&gt; *          &lt;/lfm:faultHandlers&gt; *		&lt;/lfm:Playlist&gt; * &lt;/EventHandlers&gt; * </listing> * * @mxml * <p>The <code>&lt;Playlist&gt;</code> tag has following tag attributes:</p> * <pre> * &lt;Playlist * <b>Properties</b> * method='String' * session='ILFMSession' * artist='String' * album='String' * track='String' * user='String' * limit='Number' * page='Number' * /&gt; * </pre> * * @see fm.last.as3.LFMPlaylist */public class Playlist extends LFMServiceInvoker {	public var playlistID:String;	public var track:String;	public var artist:String;	public var title:String;	public var description:String;	public var playlistURL:String;	private var _playlist:LFMPlaylist;		[Inspectable(enumeration='addTrack,create,fetch')]	/**	 * @inheritDoc	 */	override public function get method():String { return super.method; }	/**	 * @private	 */	override protected function run(scope:IScope):void {		if (_playlist)			_playlist.session = getSession(scope);		else			_playlist = new LFMPlaylist(getSession(scope));		switch (method) {			case'addTrack':				innerHandlersDispatcher = _playlist.addTrack(playlistID, track, artist);				break;			case'create':				innerHandlersDispatcher = _playlist.create(title, description);				break;			case'fetch':				innerHandlersDispatcher = _playlist.fetch(playlistURL);				break;			default:				methodUndefined(scope);		}	}}}