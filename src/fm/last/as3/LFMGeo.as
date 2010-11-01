/* Copyright (c) 2008 David White Copyright (c) 2010 Omar Valiev Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. @ignore */package fm.last.as3 {import flash.net.URLLoader;/** * The LFMGeo class provide methods that calls all last.fm geo web services. * * @includeExample LFMGeoExample.as */public class LFMGeo extends LFMBase {	/**	 * Constructor.	 * @param session need to make calls to last.fm services.	 */	public function LFMGeo(session:ILFMSession) {		super(session);	}	/**	 * Get all events in a specific location by country or city name.	 * @param location specifies a location to retrieve events for (service returns nearby events by default)	 * @param lat specifies a latitude value to retrieve events for (service returns nearby events by default)	 * @param long specifies a longitude value to retrieve events for (service returns nearby events by default)	 * @param page display more results by pagination	 * @param distance find events within a specified radius (in kilometres)	 * @return loader load response.	 */	public function getEvents(location:String = null, lat:Number = NaN,	                          long:Number = NaN, page:Number = NaN,	                          distance:Number = NaN):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getEvetns';		if (location)			variables.location = location;		if (lat)			variables.lat = lat;		if (long)			variables.long = long;		if (page)			variables.page = page;		if (distance)			variables.distance = distance;		return call(variables);	}	/**	 * Get a chart of artist for a metro	 *	 * @param country a country name, as defined by the ISO 3166-1 country names standard	 * @param metro the metro's name	 * @param start beginning timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @param end ending timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @return loader load response.	 */	public function getMetroArtistChart(country:String, metro:String, start:String = null,	                                    end:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetroArtistChart';		variables.country = country;		variables.metro = metro;		if (start)			variables.start = start;		if (end)			variables.end;		return call(variables);	}	/**	 * Get a chart of hyped (up and coming) artists for a metro	 * @param country a country name, as defined by the ISO 3166-1 country names standard	 * @param metro the metro's name	 * @param start beginning timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @param end ending timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @return loader load response.	 */	public function getMetroHypeArtistChart(country:String, metro:String,	                                        start:String = null,	                                        end:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetroHypeArtistChart';		variables.country = country;		variables.metro = metro;		if (start)			variables.start = start;		if (end)			variables.end;		return call(variables);	}	/**	 * Get a chart of tracks for a metro	 * @param country a country name, as defined by the ISO 3166-1 country names standard	 * @param metro the metro's name	 * @param start beginning timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @param end ending timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @return loader load response.	 */	public function getMetroHypeTrackChart(country:String, metro:String,	                                       start:String = null,	                                       end:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetroHypeTrackChart';		variables.country = country;		variables.metro = metro;		if (start)			variables.start = start;		if (end)			variables.end;		return call(variables);	}	/**	 * Get a chart of tracks for a metro	 * @param country a country name, as defined by the ISO 3166-1 country names standard	 * @param metro the metro's name	 * @param start beginning timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @param end ending timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @return loader load response.	 */	public function getMetroTrackChart(country:String, metro:String,	                                   start:String = null,	                                   end:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetroTrackChart';		variables.country = country;		variables.metro = metro;		if (start)			variables.start = start;		if (end)			variables.end;		return call(variables);	}	/**	 * Get a chart of the artists which make that metro unique	 * @param country a country name, as defined by the ISO 3166-1 country names standard	 * @param metro the metro's name	 * @param start beginning timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @param end ending timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @return loader load response.	 */	public function getMetroUniqueArtistChart(country:String, metro:String,	                                          start:String = null,	                                          end:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetroUniqueArtistChart';		variables.country = country;		variables.metro = metro;		if (start)			variables.start = start;		if (end)			variables.end;		return call(variables);	}	/**	 * Get a chart of tracks for a metro which make that metro unique	 * @param country a country name, as defined by the ISO 3166-1 country names standard	 * @param metro the metro's name	 * @param start beginning timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @param end ending timestamp of the weekly range requested (c.f. geo.getWeeklyChartlist)	 * @return loader load response.	 */	public function getMetroUniqueTrackChart(country:String, metro:String,	                                         start:String = null,	                                         end:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetroUniqueTrackChart';		variables.country = country;		variables.metro = metro;		if (start)			variables.start = start;		if (end)			variables.end;		return call(variables);	}	/**	 * Get a list of available chart periods for this metro, expressed as date ranges	 * which can be sent to the chart services.	 * @return loader load response.	 */	public function getMetroWeeklyChartlist():URLLoader {		return call({method:'geo.getMetroWeeklyChartlist'});	}	/**	 * Get a list of valid countries and metros for use in the other webservices	 * @param country optionally restrict the results to those Metros from a particular	 * country, as defined by the ISO 3166-1 country names standard	 * @return loader load response.	 */	public function getMetros(country:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getMetros';		if (country)			variables.country = country;		return call(variables);	}	/**	 * Get the most popular artists on Last.fm by country	 * @param country the name of the country as defined by the ISO 3166-1 country	 * names standard.	 * @return loader load response.	 */	public function getTopArtists(country:String):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getTopArtists';		if (country)			variables.country = country;		return call(variables);	}	/**	 * Get the most popular tracks on Last.fm last week by country	 * @param country the name of the country as defined by the ISO 3166-1 country names standard.	 * @param country a metro name, to fetch the charts for (must be within the country specified).	 * @return loader load response.	 */	public function getTopTracks(country:String, location:String = null):URLLoader {		var variables:Object = new Object();		variables.method = 'geo.getTopTracks';		variables.country = country;		if (location)			variables.location = location;		return call(variables);	}}}