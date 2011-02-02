/*
 Copyright (c) 2010 Omar Valiev

 Permission is hereby granted, free of charge, to any person obtaining a copy of this
 software and associated documentation files (the "Software"), to deal in the Software
 without restriction, including without limitation the rights to use, copy, modify,
 merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to the following
 conditions:

 The above copyright notice and this permission notice shall be included in all copies
 or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @ignore
 */

package fm.last.mate {
import com.asfusion.mate.actionLists.IScope;

import fm.last.as3.LFMChart;
import fm.last.as3.LFMUser;
/**
 * <code>Chart</code> tag send request to last.fm service.
 *
 * <p>If you whant set property using SmartObject use <code>&lt;Properties /&gt;</code> tag
 * (except session property).</p>
 *
 * <p>See <code>LMFChart</code> class for information about methods and arguments.</p>
 *
 * @example using Chart tag in &lt;EventHandlers /&gt;.
 * <listing version="3.0">
 * &lt;EventHandlers type="{ChartEvent.GET_TOP_ARTISTS}"&gt;
 *		&lt;lfm:Chart method="getTopArtists" session="{event.session}"&gt;
 *			&lt;lfm:resultHandlers&gt;
 *				&lt;MethodInvoker generator="{AppController}" method="setTopArtists"
 *				                  arguments="{[resultObject]}" /&gt;
 *			&lt;/lfm:resultHandlers&gt;
 *          &lt;lfm:faultHandlers&gt;
 *              &lt;MethodInvoker generator="{AppController}" method="faultHandler"
 *                                arguments="{[fault]}" /&gt;
 *          &lt;/lfm:faultHandlers&gt;
 *		&lt;/lfm:Chart&gt;
 * &lt;/EventHandlers&gt;
 * </listing>
 *
 * @mxml
 * <p>The <code>&lt;User&gt;</code> tag has following tag attributes:</p>
 * <pre>
 * &lt;User
 * <b>Properties</b>
 * method='String'
 * /&gt;
 * </pre>
 *
 * @see fm.last.as3.LFMChart
 */
public class Chart extends LFMServiceInvoker {
	private var _chart:LFMChart

	[Inspectable(enumeration='getHypedArtists,getHypedTracks,getLovedTracks,getTopArtists,getTopTags,getTopTracks')]
	/**
	 * @inheritDoc
	 */
	override public function get method():String { return super.method; }

	/**
	 * @private
	 */
	override protected function run(scope:IScope):void {
		if (_chart)
			_chart.session = getSession(scope);
		else
			_chart = new LFMChart(getSession(scope));

		switch (method) {
			case 'getHypedArtists':
                innerHandlersDispatcher = _chart.getHypedArtists();
                break;
            case 'getHypedTracks':
                innerHandlersDispatcher = _chart.getHypedTracks();
                break;
            case 'getLovedTracks':
                innerHandlersDispatcher = _chart.getLovedTracks();
                break;
            case 'getTopArtists':
                innerHandlersDispatcher = _chart.getTopArtists();
                break;
            case 'getTopTags':
                innerHandlersDispatcher = _chart.getTopTags();
                break;
            case 'getTopTracks':
                innerHandlersDispatcher = _chart.getTopTracks();
				break;
			default:
				methodUndefined(scope);
		}
	}
}
}
