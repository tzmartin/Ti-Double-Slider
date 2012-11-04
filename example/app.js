var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

// Double Slider example

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

var leftLabel = Ti.UI.createLabel({
	top:30,
	left:20,
	width:100,
	height: 20,
	color:'black',
	text:dSlider.leftValue
});
win.add(leftLabel);

var rightLabel = Ti.UI.createLabel({
	top:30,
	right:20,
	width:100,
	height: 20,
	color:'black',
	text:dSlider.rightValue,
	textAlign:'right'
});
win.add(rightLabel);

dSlider.addEventListener('touchstart', function(e) {
	if (typeof e.value !== 'undefined') {
		if (e.thumbIndex === 0) {
			leftLabel.text = e.value.toFixed(1);
			leftLabel.color = 'red';
		}
		else {
			rightLabel.text = e.value.toFixed(1);
			rightLabel.color = 'red';
		}
	}
	else {
		leftLabel.color = 'gray';
		rightLabel.color = 'gray';
	}
});

dSlider.addEventListener('change', function(e) {
	if (e.thumbIndex === 0) {
		leftLabel.text = e.value.toFixed(1);
	}
	else {
		rightLabel.text = e.value.toFixed(1);
	}
});

dSlider.addEventListener('touchend', function(e) {
	if (typeof e.value !== 'undefined') {
		if (e.thumbIndex === 0) {
			leftLabel.text = e.value.toFixed(1);
			leftLabel.color = 'black';
		}
		else {
			rightLabel.text = e.value.toFixed(1);
			rightLabel.color = 'black';
		}
	}
	else {
		leftLabel.color = 'black';
		rightLabel.color = 'black';
	}
});


// Normal Titanium.UI.Slider for comparison

var uiSlider = Ti.UI.createSlider({
	top: 120,
	height: 50,
	width:280,
	leftTrackImage:'left2.png',
	highlightedLeftTrackImage:'highlightedLeft2.png',
	disabledLeftTrackImage:'disabledLeft2.png',
	rightTrackImage:'right2.png',
	highlightedRightTrackImage:'highlightedRight2.png',
	disabledRightTrackImage:'disabledRight2.png',
	thumbImage:'thumb.png',
	highlightedThumbImage:'highlightedThumb.png',
	disabledThumbImage:'disabledThumb.png',
	min: 0,
	max: 100,
	value: 50,
	enabled: true
});
win.add(uiSlider);

var bottomLabel = Ti.UI.createLabel({
	top:95,
	width:100,
	height: 20,
	color:'black',
	text:uiSlider.value,
	textAlign:'center'
});
win.add(bottomLabel);

var button = Ti.UI.createButton({
	top:300,
	height:40,
	width:100,
	title:"Toggle"
});
win.add(button);

uiSlider.addEventListener('touchstart', function(e) {
	if (typeof e.value !== 'undefined') {
		bottomLabel.text = e.value.toFixed(1);
		bottomLabel.color = 'red';
	}
	else {
		bottomLabel.color = 'gray';
	}
});

uiSlider.addEventListener('change', function(e) {
	bottomLabel.text = e.value.toFixed(1);
});

uiSlider.addEventListener('touchend', function(e) {
	if (typeof e.value !== 'undefined') {
		bottomLabel.text = e.value.toFixed(1);
		bottomLabel.color = 'black';
	}
	else {
		bottomLabel.color = 'black';
	}
});

// Button to toggle enabled state

button.addEventListener('click', function() {
	dSlider.enabled = !dSlider.enabled;
	uiSlider.enabled = !uiSlider.enabled;
});

win.open();
