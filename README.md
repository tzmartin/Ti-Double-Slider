# Titanium Double Slider

This iOS module creates a native double slider UI View component for Titanium Mobile.  Handy for selecting a range of values (ie, hours of operation, financial budget ranges, etc).  This module has facilities for customizing the look and feel during touch events.


![Status Bar Overlay Example](https://www.evernote.com/shard/s14/sh/62c41a54-9dab-4c39-9909-fec3cf395376/e4245b0f76765456ee72ae862abdc720/res/455d5bd8-30b2-43b8-92d3-918090696398/skitch.png)

#### Video: [https://vimeo.com/52779198](https://vimeo.com/52779198)
#### Buy the module: [marketplace.appcelerator.com/apps/3971?1035637343](marketplace.appcelerator.com/apps/3971?1035637343)


## Usage

````
var tidoubleslider = require('com.semanticpress.tidoubleslider');

var dSlider = tidoubleslider.createSlider({
	top: 40,
	height: 50,
	width: 280,
	leftTrackImage:'left2.png',
	highlightedLeftTrackImage:'highlightedLeft2.png',
	disabledLeftTrackImage:'disabledLeft2.png',
	centerTrackImage:'center2.png',
	highlightedCenterTrackImage:'highlightedCenter2.png',
	disabledCenterTrackImage:'disabledCenter2.png',
	rightTrackImage:'right2.png',
	highlightedRightTrackImage:'highlightedRight2.png',
	disabledRightTrackImage:'disabledRight2.png',
	leftThumbImage:'thumb.png',
	highlightedLeftThumbImage:'highlightedThumb.png',
	disabledLeftThumbImage:'disabledThumb.png',
	rightThumbImage:'thumb.png',
	highlightedRightThumbImage:'highlightedThumb.png',
	disabledRightThumbImage:'disabledThumb.png',
	min:0,
	max:100,
	leftValue:25,
	rightValue:50,
	enabled: true
});
win.add(dSlider);
````
	
## Authors

Curtis Duhn: [@cduhn](https://twitter.com/cduhn)

Terry Martin: [@tzmartin](http://twitter.com/tzmartin)

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=tzmartin&url=http://github.com/tzmartin/Ti-Double-Slider&title=Ti-Double-Slider&language=&tags=github&category=software)

## License

The MIT License

Copyright (c) 2011 Semantic Press, Inc.

Permission is hereby granted, free of charge, 
to any person obtaining a copy of this software and 
associated documentation files (the "Software"), to 
deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell 
copies of the Software, and to permit persons to whom 
the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice 
shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

![Hi](https://c.statcounter.com/8431486/0/fecc5033/1/)