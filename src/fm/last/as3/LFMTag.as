/* Copyright (c) 2010 Omar Valiev Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. @ignore */package fm.last.as3 {import flash.net.URLLoader;/** * The LFMTag class provide methods that calls all last.fm tag web services. * * @includeExample LFMTagExample.as */public class LFMTag extends LFMBase {	/**	 * Constructor	 * @param session make calls to last.fm services.	 */	public function LFMTag(session:ILFMSession) {		super(session);	}	/**	 * Get the metadata for a tag.	 * @param artist the artist name	 * @param lang the language to return the biography in, expressed as an ISO 639 alpha-2 code.	 * @result loader load response	 */	public function getInfo(artist:String, lang:String = null):URLLoader{		var variables:Object = new Object();		variables.artist = artist;		if (lang)			variables.lang = lang;		return call(variables);	}		/**	 * Search for tags similar to this one. Returns tags ranked by similarity, based	 * on listening data.	 * @param tag tag name in question.	 * @return loader load response.	 */	public function getSimilar(tag:String):URLLoader {		return call({			method:'tag.getSimilar',			tag:tag		});	}	/**	 * Get the top albums tagged by this tag, ordered by tag count.	 * @param tag tag name in question.	 * @return loader load response.	 */	public function getTopAlbums(tag:String):URLLoader {		return call({			method:'tag.getTopAlbums',			tag:tag		});	}	/**	 * Get the top artists tagged by this tag, ordered by tag count.	 * @param tag tag name in question.	 * @return loader load response.	 */	public function getTopArtists(tag:String):URLLoader {		return call({			method:'tag.getTopArtists',			tag:tag		});	}	/**	 * Fetches the top global tags on Last.fm, sorted by popularity (number of times used)	 * @return loader load response.	 */	public function getTopTags():URLLoader {		return call({			method:'tag.getTopTags'		});	}	/**	 * Get the top tracks tagged by this tag, ordered by tag count.	 * @param tag tag name in question.	 * @return loader load response.	 */	public function getTopTracks(tag:String):URLLoader {		return call({			method:'tag.getTopTracks',			tag:tag		});	}	/**	 * Get an artist chart for a tag, for a given date range. If no date range is supplied,	 * it will return the most recent artist chart for this tag.	 * @param tag the tag name in question	 * @param from the date at which the chart should start from. See Tag.getWeeklyChartList	 * for more.	 * @param to the date at which the chart should end on. See Tag.getWeeklyChartList	 * for more.	 * @param limit the number of chart items to return (default 50).	 * @return loader load response.	 * 	 * @see fm.last.as3.LFMTag.getWeeklyChartList	 */	public function getWeeklyArtistChart(tag:String, from:Number = NaN, to:Number = NaN,	                                     limit:Number = NaN):URLLoader {		var variables:Object = new Object();		variables.method = 'tag.getWeeklyArtistChart';		if (!isNaN(from))			variables.from = from;		if (!isNaN(to))			variables.to = to;		if (!isNaN(limit))			variables.limit = limit;		return call(variables);	}	/**	 * Get a list of available charts for this tag, expressed as date ranges which can	 * be sent to the chart services.	 * @param tag the tag name in question.	 * @return loader load response.	 */	public function getWeeklyChartList(tag:String):URLLoader {		return call({			method:'tag.getWeeklyChartList',			tag:tag		});	}	/**	 * Search for a tag by name. Returns matches sorted by relevance.	 * @param tag the tag name in question	 * @param limit limit the number of tags returned at one time. Default (maximum) is 30.	 * @param page scan into the results by specifying a page number. Defaults to first page.	 * @return loader load response.	 */	public function search(tag:String, limit:Number = NaN, page:Number = NaN):URLLoader {		var variables:Object = new Object();		variables.method = 'tag.search';		variables.tag = tag;		if (!isNaN(limit))			variables.limit = limit;		if (!isNaN(page))			variables.page = page;		return call(variables);	}}}