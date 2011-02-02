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

package fm.last.as3 {
import flash.net.URLLoader;

/**
 * The LFMChart class provide methods that calls all last.fm artist web services.
 */

public class LFMChart extends LFMBase{
    public function LFMChart(session:ILFMSession) {
        super(session);
    }

    /**
     * Get the hyped artists chart
     * @return loader load response.
     */
    public function getHypedArtists():URLLoader{
        return call({method:"chart.getHypedArtists"});
    }

    /**
     * Get the top artists chart
     * @return loader load response.
     */
    public function getHypedTracks():URLLoader{
        return call({method:"chart.getHypedTracks"});
    }

    /**
     * Get the most loved tracks chart.
     * @return loader load response.
     */
    public function getLovedTracks():URLLoader{
        return call({method:"chart.getLovedTracks"});
    }


    /**
     * Get the top artists chart.
     * @return loader load response.
     */
    public function getTopArtists():URLLoader{
        return call({method:"chart.getTopArtists"});
    }

    /**
     * Get the top artists chart.
     * @return loader load response.
     */
    public function getTopTags():URLLoader{
        return call({method:"chart.getTopTags"});
    }

    /**
     * Get the top tracks chart.
     * @return loader load response.
     */
    public function getTopTracks():URLLoader{
        return call({method:"chart.getTopTracks"});
    }

}
}
