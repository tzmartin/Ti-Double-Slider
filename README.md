# Titanium Double Slider

This iOS module creates a native double slider UI View component for Titanium Mobile.  Handy for selecting a range of values (ie, hours of operation, financial budget ranges, etc).  This module has facilities for customizing the look and feel during touch events.


![Status Bar Overlay Example](https://www.evernote.com/shard/s14/sh/1db3300d-d692-46a6-877a-74c7a5fe9f76/e5b08a2d78f92c5dbeaae7303c8e7a2a/res/d58da191-75ac-4a50-bae1-0302bb694c9f/skitch.png?noteKey=e5b08a2d78f92c5dbeaae7303c8e7a2a&suffix=res%2Fd58da191-75ac-4a50-bae1-0302bb694c9f%2Fskitch.png&noteGuid=1db3300d-d692-46a6-877a-74c7a5fe9f76)


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

