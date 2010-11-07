/* Copyright (c) 2010 Omar Valiev Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. @ignore */package fm.last.mate {import com.asfusion.mate.actionLists.IScope;import fm.last.as3.LFMTag;/** * <code>Tag</code> tag send request to last.fm service. * * <p>If you whant set property using SmartObject use <code>&lt;Properties /&gt;</code> tag * (except session property).</p> * * <p>See <code>LFMTag</code> class for information about methods and arguments.</p> * * @example using Tag tag in &lt;EventHandlers /&gt;. * <listing version="3.0"> * &lt;EventHandlers type="{TagEvent.GET_TOP_ALBUMS}"&gt; *		&lt;lfm:Tag method="getTopAlbums" session="{event.session}"&gt; *			&lt;Properties event="{event.tag}" /&gt; *			&lt;lfm:resultHandlers&gt; *				&lt;MethodInvoker generator="{AppController}" method="setTopAlbumsForTag" *				                  arguments="{[resultObject]}" /&gt; *			&lt;/lfm:resultHandlers&gt; *          &lt;lfm:faultHandlers&gt; *              &lt;MethodInvoker generator="{AppController}" method="faultHandler" *                                arguments="{[fault]}" /&gt; *          &lt;/lfm:faultHandlers&gt; *		&lt;/lfm:Tag&gt; * &lt;/EventHandlers&gt; * </listing> * * @mxml * <p>The <code>&lt;Tag&gt;</code> tag has following tag attributes:</p> * <pre> * &lt;Tag * <b>Properties</b> * method='String' * session='ILFMSession' * tag='String' * from='String' * to='Number' * limit='Number' * page='Number' * artist='String' * lang='String' * /&gt; * </pre> * * @see fm.last.as3.LFMTag */public class Tag extends LFMServiceInvoker {	public var tag:String;	public var from:Number;	public var to:Number;	public var limit:Number;	public var page:Number;	public var artist:String;	public var lang:String;	private var _tag:LFMTag;	[Inspectable(enumeration='getInfo,getSimilar,getTopAlbums,getTopArtists,getTopTags,getTopTracks,getWeeklyArtistChart,getWeeklyChartList,search')]	/**	 * @inheritDoc	 */	override public function get method():String { return super.method; }	/**	 * @private	 */	override protected function run(scope:IScope):void {		if (_tag)			_tag.session = getSession(scope);		else			_tag = new LFMTag(getSession(scope));		switch (method) {			case'getInfo':				innerHandlersDispatcher = _tag.getInfo(artist,lang);				break;			case'getSimilar':				innerHandlersDispatcher = _tag.getSimilar(tag);				break;			case'getTopAlbums':				innerHandlersDispatcher = _tag.getTopAlbums(tag);				break;			case'getTopArtists':				innerHandlersDispatcher = _tag.getTopArtists(tag);				break;			case'getTopTags':				innerHandlersDispatcher = _tag.getTopTags();				break;			case'getTopTracks':				innerHandlersDispatcher = _tag.getTopTracks(tag);				break;			case'getWeeklyArtistChart':				innerHandlersDispatcher = _tag.getWeeklyArtistChart(tag, from, to, limit);				break;			case'getWeeklyChartList':				innerHandlersDispatcher = _tag.getWeeklyChartList(tag);				break;			case'search':				innerHandlersDispatcher = _tag.search(tag, limit, page);				break;			default:				methodUndefined(scope);		}	}}}