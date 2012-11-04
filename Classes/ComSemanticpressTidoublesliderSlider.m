//
//  ComSemanticpressTidoublesliderSlider.m
//  tidoubleslider
//
//  Created by Curtis Duhn on 9/9/11.
//  Copyright (c) 2012 by Semantic Press, Inc. All rights reserved.
//

#import "ComSemanticpressTidoublesliderSlider.h"

@interface ComSemanticpressTidoublesliderSlider()
@property (nonatomic, retain) UIView *_wrapperView;
@property (nonatomic, readonly) UIView *wrapperView;
@property (nonatomic, retain) UIImage *_leftTrackImageFull;
@property (nonatomic, retain) UIImage *_leftTrackImageLeft;
@property (nonatomic, retain) UIImage *_centerTrackImageFull;
@property (nonatomic, retain) UIImage *_centerTrackImageLeft;
@property (nonatomic, retain) UIImage *_centerTrackImageCenter;
@property (nonatomic, retain) UIImage *_centerTrackImageRight;
@property (nonatomic, retain) UIImage *_rightTrackImageFull;
@property (nonatomic, retain) UIImage *_rightTrackImageRight;

@property (nonatomic, retain) UIImage *_highlightedLeftTrackImageFull;
@property (nonatomic, retain) UIImage *_highlightedLeftTrackImageLeft;
@property (nonatomic, retain) UIImage *_highlightedCenterTrackImageFull;
@property (nonatomic, retain) UIImage *_highlightedCenterTrackImageLeft;
@property (nonatomic, retain) UIImage *_highlightedCenterTrackImageCenter;
@property (nonatomic, retain) UIImage *_highlightedCenterTrackImageRight;
@property (nonatomic, retain) UIImage *_highlightedRightTrackImageFull;
@property (nonatomic, retain) UIImage *_highlightedRightTrackImageRight;

@property (nonatomic, retain) UIImage *_disabledLeftTrackImageFull;
@property (nonatomic, retain) UIImage *_disabledLeftTrackImageLeft;
@property (nonatomic, retain) UIImage *_disabledCenterTrackImageFull;
@property (nonatomic, retain) UIImage *_disabledCenterTrackImageLeft;
@property (nonatomic, retain) UIImage *_disabledCenterTrackImageCenter;
@property (nonatomic, retain) UIImage *_disabledCenterTrackImageRight;
@property (nonatomic, retain) UIImage *_disabledRightTrackImageFull;
@property (nonatomic, retain) UIImage *_disabledRightTrackImageRight;

@property (nonatomic, retain) UIImageView *_leftTrackImageView;
@property (nonatomic, retain) UIImageView *_centerTrackImageView;
@property (nonatomic, retain) UIImageView *_rightTrackImageView;

@property (nonatomic, retain) UIImageView *_leftThumbImageView;
@property (nonatomic, retain) UIImageView *_rightThumbImageView;
@property (nonatomic, retain) UIImageView *_highlightedLeftThumbImageView;
@property (nonatomic, retain) UIImageView *_highlightedRightThumbImageView;
@property (nonatomic, retain) UIImageView *_disabledLeftThumbImageView;
@property (nonatomic, retain) UIImageView *_disabledRightThumbImageView;


- (UIImage *)cropImage:(UIImage *)image toWidth:(CGFloat)width atLeft:(CGFloat)left;
- (CGRect)frameForLeftTrack;
- (CGRect)frameForCenterTrack;
- (CGRect)frameForRightTrack;
- (CGFloat)leftTrackDividerXPosition;
- (CGFloat)rightTrackDividerXPosition;
- (void)configureTrackView:(UIImageView *)trackView toClipWithContentMode:(UIViewContentMode)mode;
- (void)layoutImageSubviews;
- (void)layoutTracks;
- (UIImage *)fullCenterTrackImageForState;
- (UIImage *)leftTwoThirdsOfCenterTrackImageForState;
- (UIImage *)centerThirdOfCenterTrackImageForState;
- (UIImage *)rightTwoThirdsOfCenterTrackImageForState;
- (UIImage *)fullLeftTrackImageForState;
- (UIImage *)leftHalfOfLeftTrackImageForState;
- (UIImage *)fullRightTrackImageForState;
- (UIImage *)rightHalfOfRightTrackImageForState;
- (void)showAppropriateThumbsForState;
- (void)layoutThumbs;
- (void)bringAppropriateThumbToFront;
- (CGFloat)normalizedLeftValue;
- (CGFloat)normalizedRightValue;
- (CGPoint)leftThumbPosition;
- (CGPoint)rightThumbPosition;
- (CGFloat)activeTrackWidth;
- (UIImageView *)leftThumbViewToUseForTrackSizing;
- (UIImageView *)rightThumbViewToUseForTrackSizing;
- (CGPoint)minLocation;
- (CGPoint)maxLocation;
- (BOOL)touchIsOnLeftThumb:(UITouch *)touch;
- (BOOL)touchIsOnRightThumb:(UITouch *)touch;
- (BOOL)touchIsCloserToLeftThumb:(UITouch *)touch;
- (BOOL)touchIsCloserToRightThumb:(UITouch *)touch;
- (CGFloat)distanceToLeftThumb:(UITouch *)touch;
- (CGFloat)distanceToRightThumb:(UITouch *)touch;
- (CGFloat)leftThumbTouchRadius;
- (CGFloat)rightThumbTouchRadius;
- (CGFloat)humanFingerRadius;
- (CGFloat)distanceFromCenterToCorner:(UIView *)aView;
- (CGFloat)distanceForRise:(CGFloat)rise run:(CGFloat)run;
- (void)startLeftDrag:(UITouch *)touch;
- (void)startRightDrag:(UITouch *)touch;
- (void)updateDrag:(UITouch *)touch;
- (void)endDrag:(UITouch *)touch;
- (CGPoint)clippedLocationForTouchDelta:(UITouch *)touch;
- (CGFloat)valueForLocation:(CGPoint)location;
- (CGFloat)valuePerPoint;
- (CGPoint)unclippedLocationForTouchDelta:(UITouch *)touch;
- (void)valueChangedForThumbWithIndex:(NSInteger)index value:(CGFloat)value;
- (void)touchStartedForThumbWithIndex:(NSInteger)index value:(CGFloat)value;
- (void)touchStartedNotOnThumb;
- (void)touchEndedForThumbWithIndex:(NSInteger)index value:(CGFloat)value;
- (void)touchEndedNotOnThumb;
- (NSString *)proxyKeyForThumbWithIndex:(NSInteger)index;
@end

@implementation ComSemanticpressTidoublesliderSlider
@synthesize _wrapperView, _leftTrackImageFull, _leftTrackImageLeft, _centerTrackImageFull, _centerTrackImageLeft, _centerTrackImageCenter, _centerTrackImageRight, _rightTrackImageFull, _rightTrackImageRight;
@synthesize _highlightedLeftTrackImageFull, _highlightedLeftTrackImageLeft, _highlightedCenterTrackImageFull, _highlightedCenterTrackImageLeft, _highlightedCenterTrackImageCenter, _highlightedCenterTrackImageRight, _highlightedRightTrackImageFull, _highlightedRightTrackImageRight;
@synthesize _disabledLeftTrackImageFull, _disabledLeftTrackImageLeft, _disabledCenterTrackImageFull, _disabledCenterTrackImageLeft, _disabledCenterTrackImageCenter, _disabledCenterTrackImageRight, _disabledRightTrackImageFull, _disabledRightTrackImageRight;
@synthesize _leftTrackImageView, _centerTrackImageView, _rightTrackImageView, _leftThumbImageView, _rightThumbImageView, _highlightedLeftThumbImageView, _highlightedRightThumbImageView, _disabledLeftThumbImageView, _disabledRightThumbImageView;

#pragma mark Memory management

- (void)dealloc {
    self._wrapperView = nil;
    
    self._leftTrackImageFull = nil;
    self._leftTrackImageLeft = nil;
    self._centerTrackImageFull = nil;
    self._centerTrackImageLeft = nil;
    self._centerTrackImageCenter = nil;
    self._centerTrackImageRight = nil;
    self._rightTrackImageFull = nil;
    self._rightTrackImageRight = nil;
    
    self._highlightedLeftTrackImageFull = nil;
    self._highlightedLeftTrackImageLeft = nil;
    self._highlightedCenterTrackImageFull = nil;
    self._highlightedCenterTrackImageLeft = nil;
    self._highlightedCenterTrackImageCenter = nil;
    self._highlightedCenterTrackImageRight = nil;
    self._highlightedRightTrackImageFull = nil;
    self._highlightedRightTrackImageRight = nil;

    self._disabledLeftTrackImageFull = nil;
    self._disabledLeftTrackImageLeft = nil;
    self._disabledCenterTrackImageFull = nil;
    self._disabledCenterTrackImageLeft = nil;
    self._disabledCenterTrackImageCenter = nil;
    self._disabledCenterTrackImageRight = nil;
    self._disabledRightTrackImageFull = nil;
    self._disabledRightTrackImageRight = nil;

    self._leftTrackImageView = nil;
    self._centerTrackImageView = nil;
    self._rightTrackImageView = nil;
        
    self._leftThumbImageView = nil;
    self._rightThumbImageView = nil;
    self._highlightedLeftThumbImageView = nil;
    self._highlightedRightThumbImageView = nil;
    self._disabledLeftThumbImageView = nil;
    self._disabledRightThumbImageView = nil;
    
    [super dealloc];
}

#pragma mark --
#pragma Javascript properties

#pragma mark leftThumbImage

- (void)setLeftThumbImage_:(id)value {
    UIImage *newThumbImage = [TiUtils image:value proxy:[self proxy]];
    if (newThumbImage) {
        if (!_leftThumbImageView) {
            self._leftThumbImageView = [[[UIImageView alloc] initWithImage:newThumbImage] autorelease];
            if (_leftThumbImageView) [self.wrapperView addSubview:_leftThumbImageView];
        }
        else {
            _leftThumbImageView.image = newThumbImage;
        }
        if (_leftThumbImageView) {
            _leftThumbImageView.frame = CGRectMake(0.0, 0.0, 
                                                   _leftThumbImageView.image.size.width, 
                                                   _leftThumbImageView.image.size.height);
        }
    }
    else {
        self._leftThumbImageView = nil;
    }
    [self layoutImageSubviews];
}

- (void)setSelectedLeftThumbImage_:(id)value {
}

- (void)setHighlightedLeftThumbImage_:(id)value {
    UIImage *newThumbImage = [TiUtils image:value proxy:[self proxy]];
    if (newThumbImage) {
        if (!_highlightedLeftThumbImageView) {
            self._highlightedLeftThumbImageView = [[[UIImageView alloc] initWithImage:newThumbImage] autorelease];
            if (_highlightedLeftThumbImageView) [self.wrapperView addSubview:_highlightedLeftThumbImageView];
        }
        else {
            _highlightedLeftThumbImageView.image = newThumbImage;
        }
    }
    else {
        self._highlightedLeftThumbImageView = nil;
    }
    [self layoutImageSubviews];
}

- (void)setDisabledLeftThumbImage_:(id)value {
    UIImage *newThumbImage = [TiUtils image:value proxy:[self proxy]];
    if (newThumbImage) {
        if (!_disabledLeftThumbImageView) {
            self._disabledLeftThumbImageView = [[[UIImageView alloc] initWithImage:newThumbImage] autorelease];
            if (_disabledLeftThumbImageView) [self.wrapperView addSubview:_disabledLeftThumbImageView];
        }
        else {
            _disabledLeftThumbImageView.image = newThumbImage;
        }
    }
    else {
        self._disabledLeftThumbImageView = nil;
    }
    [self layoutImageSubviews];
}


#pragma mark rightThumbImage

- (void)setRightThumbImage_:(id)value {
    UIImage *newThumbImage = [TiUtils image:value proxy:[self proxy]];
    if (newThumbImage) {
        if (!_rightThumbImageView) {
            self._rightThumbImageView = [[[UIImageView alloc] initWithImage:newThumbImage] autorelease];
            if (_rightThumbImageView) [self.wrapperView addSubview:_rightThumbImageView];
        }
        else {
            _rightThumbImageView.image = newThumbImage;
        }
    }
    else {
        self._rightThumbImageView = nil;
    }
    [self layoutImageSubviews];
}

- (void)setSelectedRightThumbImage_:(id)value {
}

- (void)setHighlightedRightThumbImage_:(id)value {
    UIImage *newThumbImage = [TiUtils image:value proxy:[self proxy]];
    if (newThumbImage) {
        if (!_highlightedRightThumbImageView) {
            self._highlightedRightThumbImageView = [[[UIImageView alloc] initWithImage:newThumbImage] autorelease];
            if (_highlightedRightThumbImageView) [self.wrapperView addSubview:_highlightedRightThumbImageView];
        }
        else {
            _highlightedRightThumbImageView.image = newThumbImage;
        }
    }
    else {
        self._highlightedRightThumbImageView = nil;
    }
    [self layoutImageSubviews];
}

- (void)setDisabledRightThumbImage_:(id)value {
    UIImage *newThumbImage = [TiUtils image:value proxy:[self proxy]];
    if (newThumbImage) {
        if (!_disabledRightThumbImageView) {
            self._disabledRightThumbImageView = [[[UIImageView alloc] initWithImage:newThumbImage] autorelease];
            if (_disabledRightThumbImageView) [self.wrapperView addSubview:_disabledRightThumbImageView];
        }
        else {
            _disabledRightThumbImageView.image = newThumbImage;
        }
    }
    else {
        self._disabledRightThumbImageView = nil;
    }
    [self layoutImageSubviews];
}


#pragma mark leftTrackImage
- (void)setLeftTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._leftTrackImageFull = newTrackImage;
        self._leftTrackImageLeft = [self cropImage:newTrackImage 
                                           toWidth:newTrackImage.size.width * 1 / 2
                                            atLeft:0.0];
        if (_leftTrackImageView) {
            _leftTrackImageView.image = _leftTrackImageLeft;
        }
        else {
            self._leftTrackImageView = [[[UIImageView alloc] initWithImage:_leftTrackImageLeft] autorelease];
            self._leftTrackImageView.clipsToBounds = YES;
            _leftTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                    UIViewAutoresizingFlexibleBottomMargin |
                                                    UIViewAutoresizingFlexibleWidth |
                                                    UIViewAutoresizingFlexibleRightMargin);
        }
        
        if (!_leftTrackImageView.superview) {
            [self.wrapperView addSubview:_leftTrackImageView];
        }
    }
    else {
        self._leftTrackImageFull = nil;
        self._leftTrackImageLeft = nil;
        if (!_leftTrackImageFull && !_highlightedLeftTrackImageFull) {
            self._leftTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}

- (void)setSelectedLeftTrackImage_:(id)value {
}

- (void)setHighlightedLeftTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._highlightedLeftTrackImageFull = newTrackImage;
        self._highlightedLeftTrackImageLeft = [self cropImage:newTrackImage 
                                           toWidth:newTrackImage.size.width * 1 / 2
                                            atLeft:0.0];
        if (!_leftTrackImageView) {
            self._leftTrackImageView = [[[UIImageView alloc] initWithImage:_highlightedLeftTrackImageLeft] autorelease];
            self._leftTrackImageView.clipsToBounds = YES;
            _leftTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                    UIViewAutoresizingFlexibleBottomMargin |
                                                    UIViewAutoresizingFlexibleWidth |
                                                    UIViewAutoresizingFlexibleRightMargin);
        }
        
        if (!_leftTrackImageView.superview) {
            [self.wrapperView addSubview:_leftTrackImageView];
        }
    }
    else {
        self._highlightedLeftTrackImageFull = nil;
        self._highlightedLeftTrackImageLeft = nil;
        if (!_leftTrackImageFull && !_highlightedLeftTrackImageFull) {
            self._leftTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}

- (void)setDisabledLeftTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._disabledLeftTrackImageFull = newTrackImage;
        self._disabledLeftTrackImageLeft = [self cropImage:newTrackImage 
                                                      toWidth:newTrackImage.size.width * 1 / 2
                                                       atLeft:0.0];
        if (!_leftTrackImageView) {
            self._leftTrackImageView = [[[UIImageView alloc] initWithImage:_disabledLeftTrackImageLeft] autorelease];
            self._leftTrackImageView.clipsToBounds = YES;
            _leftTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                    UIViewAutoresizingFlexibleBottomMargin |
                                                    UIViewAutoresizingFlexibleWidth |
                                                    UIViewAutoresizingFlexibleRightMargin);
        }
        
        if (!_leftTrackImageView.superview) {
            [self.wrapperView addSubview:_leftTrackImageView];
        }
    }
    else {
        self._disabledLeftTrackImageFull = nil;
        self._disabledLeftTrackImageLeft = nil;
        if (!_leftTrackImageFull && !_highlightedLeftTrackImageFull) {
            self._leftTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}


#pragma mark centerTrackImage

- (void)setCenterTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._centerTrackImageFull = newTrackImage;
        self._centerTrackImageLeft = [self cropImage:newTrackImage 
                                             toWidth:newTrackImage.size.width * 2 / 3
                                              atLeft:0.0];
        self._centerTrackImageCenter = [self cropImage:newTrackImage 
                                               toWidth:newTrackImage.size.width * 1 / 3
                                                atLeft:newTrackImage.size.width * 1 / 3];
        self._centerTrackImageRight = [self cropImage:newTrackImage 
                                              toWidth:newTrackImage.size.width * 2 / 3
                                               atLeft:newTrackImage.size.width * 1 / 3];
        if (_centerTrackImageView) {
            _centerTrackImageView.image = _centerTrackImageCenter;
        }
        else {
            self._centerTrackImageView = [[[UIImageView alloc] initWithImage:_centerTrackImageCenter] autorelease];
            self._centerTrackImageView.clipsToBounds = YES;
            _centerTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                      UIViewAutoresizingFlexibleBottomMargin |
                                                      UIViewAutoresizingFlexibleWidth |
                                                      UIViewAutoresizingFlexibleLeftMargin);
        }
        
        if (!_centerTrackImageView.superview) {
            [self.wrapperView addSubview:_centerTrackImageView];
        }
    }
    else {
        self._centerTrackImageFull = nil;
        self._centerTrackImageLeft = nil;
        self._centerTrackImageCenter = nil;
        self._centerTrackImageRight = nil;
        if (!_centerTrackImageFull && !_highlightedCenterTrackImageFull) {
            self._centerTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}

- (void)setSelectedCenterTrackImage_:(id)value {
}

- (void)setHighlightedCenterTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._highlightedCenterTrackImageFull = newTrackImage;
        self._highlightedCenterTrackImageLeft = [self cropImage:newTrackImage 
                                             toWidth:newTrackImage.size.width * 2 / 3
                                              atLeft:0.0];
        self._highlightedCenterTrackImageCenter = [self cropImage:newTrackImage 
                                               toWidth:newTrackImage.size.width * 1 / 3
                                                atLeft:newTrackImage.size.width * 1 / 3];
        self._highlightedCenterTrackImageRight = [self cropImage:newTrackImage 
                                              toWidth:newTrackImage.size.width * 2 / 3
                                               atLeft:newTrackImage.size.width * 1 / 3];
        if (_centerTrackImageView) {
            _centerTrackImageView.image = _highlightedCenterTrackImageCenter;
        }
        else {
            self._centerTrackImageView = [[[UIImageView alloc] initWithImage:_highlightedCenterTrackImageCenter] autorelease];
            self._centerTrackImageView.clipsToBounds = YES;
            _centerTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                      UIViewAutoresizingFlexibleBottomMargin |
                                                      UIViewAutoresizingFlexibleWidth |
                                                      UIViewAutoresizingFlexibleLeftMargin);
        }
        
        if (!_centerTrackImageView.superview) {
            [self.wrapperView addSubview:_centerTrackImageView];
        }
    }
    else {
        self._highlightedCenterTrackImageFull = nil;
        self._highlightedCenterTrackImageLeft = nil;
        self._highlightedCenterTrackImageCenter = nil;
        self._highlightedCenterTrackImageRight = nil;
        if (!_centerTrackImageFull && !_highlightedCenterTrackImageFull) {
            self._centerTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}

- (void)setDisabledCenterTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._disabledCenterTrackImageFull = newTrackImage;
        self._disabledCenterTrackImageLeft = [self cropImage:newTrackImage 
                                                        toWidth:newTrackImage.size.width * 2 / 3
                                                         atLeft:0.0];
        self._disabledCenterTrackImageCenter = [self cropImage:newTrackImage 
                                                          toWidth:newTrackImage.size.width * 1 / 3
                                                           atLeft:newTrackImage.size.width * 1 / 3];
        self._disabledCenterTrackImageRight = [self cropImage:newTrackImage 
                                                         toWidth:newTrackImage.size.width * 2 / 3
                                                          atLeft:newTrackImage.size.width * 1 / 3];
        if (_centerTrackImageView) {
            _centerTrackImageView.image = _disabledCenterTrackImageCenter;
        }
        else {
            self._centerTrackImageView = [[[UIImageView alloc] initWithImage:_disabledCenterTrackImageCenter] autorelease];
            self._centerTrackImageView.clipsToBounds = YES;
            _centerTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                      UIViewAutoresizingFlexibleBottomMargin |
                                                      UIViewAutoresizingFlexibleWidth |
                                                      UIViewAutoresizingFlexibleLeftMargin);
        }
        
        if (!_centerTrackImageView.superview) {
            [self.wrapperView addSubview:_centerTrackImageView];
        }
    }
    else {
        self._disabledCenterTrackImageFull = nil;
        self._disabledCenterTrackImageLeft = nil;
        self._disabledCenterTrackImageCenter = nil;
        self._disabledCenterTrackImageRight = nil;
        if (!_centerTrackImageFull && !_highlightedCenterTrackImageFull) {
            self._centerTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}


#pragma mark rightTrackImage

- (void)setRightTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._rightTrackImageFull = newTrackImage;
        self._rightTrackImageRight = [self cropImage:newTrackImage 
                                               toWidth:newTrackImage.size.width * 1 / 2
                                                atLeft:newTrackImage.size.width * 1 / 2];
        if (_rightTrackImageView) {
            _rightTrackImageView.image = _rightTrackImageRight;
        }
        else {
            self._rightTrackImageView = [[[UIImageView alloc] initWithImage:newTrackImage] autorelease];
            _rightTrackImageView.clipsToBounds = YES;
            _rightTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                     UIViewAutoresizingFlexibleBottomMargin |
                                                     UIViewAutoresizingFlexibleWidth |
                                                     UIViewAutoresizingFlexibleLeftMargin);
        }
        
        if (!_rightTrackImageView.superview) {
            [self.wrapperView addSubview:_rightTrackImageView];
        }
    }
    else {
        self._rightTrackImageFull = nil;
        self._rightTrackImageRight = nil;
        if (!_rightTrackImageFull && !_highlightedRightTrackImageFull) {
            self._rightTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}

- (void)setSelectedRightTrackImage_:(id)value {
}

- (void)setHighlightedRightTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._highlightedRightTrackImageFull = newTrackImage;
        self._highlightedRightTrackImageRight = [self cropImage:newTrackImage 
                                             toWidth:newTrackImage.size.width * 1 / 2
                                              atLeft:newTrackImage.size.width * 1 / 2];
        if (_rightTrackImageView) {
            _rightTrackImageView.image = _highlightedRightTrackImageRight;
        }
        else {
            self._rightTrackImageView = [[[UIImageView alloc] initWithImage:newTrackImage] autorelease];
            self._rightTrackImageView.clipsToBounds = YES;
            _rightTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                     UIViewAutoresizingFlexibleBottomMargin |
                                                     UIViewAutoresizingFlexibleWidth |
                                                     UIViewAutoresizingFlexibleLeftMargin);
        }
        
        if (!_rightTrackImageView.superview) {
            [self.wrapperView addSubview:_rightTrackImageView];
        }
    }
    else {
        self._highlightedRightTrackImageFull = nil;
        self._highlightedRightTrackImageRight = nil;
        if (!_rightTrackImageFull && !_highlightedRightTrackImageFull) {
            self._rightTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}

- (void)setDisabledRightTrackImage_:(id)value {
    UIImage *newTrackImage = [TiUtils stretchableImage:value proxy:[self proxy]];
    if (newTrackImage) {
        self._disabledRightTrackImageFull = newTrackImage;
        self._disabledRightTrackImageRight = [self cropImage:newTrackImage 
                                                        toWidth:newTrackImage.size.width * 1 / 2
                                                         atLeft:newTrackImage.size.width * 1 / 2];
        if (_rightTrackImageView) {
            _rightTrackImageView.image = _disabledRightTrackImageRight;
        }
        else {
            self._rightTrackImageView = [[[UIImageView alloc] initWithImage:newTrackImage] autorelease];
            self._rightTrackImageView.clipsToBounds = YES;
            _rightTrackImageView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin | 
                                                     UIViewAutoresizingFlexibleBottomMargin |
                                                     UIViewAutoresizingFlexibleWidth |
                                                     UIViewAutoresizingFlexibleLeftMargin);
        }
        
        if (!_rightTrackImageView.superview) {
            [self.wrapperView addSubview:_rightTrackImageView];
        }
    }
    else {
        self._disabledRightTrackImageFull = nil;
        self._disabledRightTrackImageRight = nil;
        if (!_rightTrackImageFull && !_highlightedRightTrackImageFull) {
            self._rightTrackImageView = nil;
        }
    }
    [self layoutImageSubviews];
}


#pragma mark Min/Max/Value

- (void)setMin_:(id)value {
    _min = [TiUtils floatValue:value];
    [self layoutImageSubviews];
}

- (void)setMax_:(id)value {
    _max = [TiUtils floatValue:value];
    [self layoutImageSubviews];
}

- (void)setLeftValue_:(id)value {
    _leftValue = [TiUtils floatValue:value];
    [self layoutImageSubviews];
}

- (void)setRightValue_:(id)value {
    _rightValue = [TiUtils floatValue:value]; 
    [self layoutImageSubviews];
}

-(void)setEnabled_:(id)value {
    _disabled = ![TiUtils boolValue:value];
    _dragging = NO;
    _thumbBeingDragged = THUMB_NONE;
    [self layoutImageSubviews];
}

#pragma mark --
#pragma mark UIView

- (id)initWithFrame:(CGRect)theFrame {
    if ((self = [super initWithFrame:theFrame])) {
        _min = 0;
        _max = 1;
        _leftValue = 0.25;
        _rightValue = 0.75;
        _dragging = NO;
        _thumbBeingDragged = THUMB_NONE;
    }
    return self;
}


#pragma mark TiUIView

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
    [self layoutImageSubviews];
    [TiUtils setView:self.wrapperView positionRect:bounds];
}

#pragma mark Dynamic properties

- (UIView *)wrapperView {
    if (!_wrapperView) {
        self._wrapperView = [[[UIView alloc] initWithFrame:self.bounds] autorelease];
        _wrapperView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _wrapperView.backgroundColor = [UIColor clearColor];
        [self addSubview:_wrapperView];
    }
    return self._wrapperView;
}

#pragma mark UIResponder

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!_disabled) {
        UITouch *touch = [touches anyObject];
        if ([self touchIsOnLeftThumb:touch]) [self startLeftDrag:touch];
        else if ([self touchIsOnRightThumb:touch]) [self startRightDrag:touch];
    }
    else {
        [self touchStartedNotOnThumb];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!_disabled) {
        UITouch *touch = [touches anyObject];
        if (_dragging) [self updateDrag:touch];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!_disabled) {
        UITouch *touch = [touches anyObject];
        if (_dragging) [self endDrag:touch];
    }
    else {
        [self touchEndedNotOnThumb];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!_disabled) {
        UITouch *touch = [touches anyObject];
        if (_dragging) [self endDrag:touch];
        else [self touchEndedNotOnThumb];
    }
    else {
        [self touchEndedNotOnThumb];
    }
}

#pragma mark Private

- (UIImage *)cropImage:(UIImage *)image toWidth:(CGFloat)width atLeft:(CGFloat)left {
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], 
                                                       CGRectMake(left, 0, width, image.size.height));
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return [newImage stretchableImageWithLeftCapWidth:newImage.size.width / 2 
                                         topCapHeight:newImage.size.height / 2];
}

- (CGRect)frameForLeftTrack {
    CGRect rect = CGRectMake(0.0, 
                      self.bounds.size.height / 2 - _leftTrackImageView.image.size.height / 2, 
                      [self leftTrackDividerXPosition], 
                      _leftTrackImageView.image.size.height);
//    NSLog(@"frameForLeftTrack: (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    return rect;
}

- (CGRect)frameForCenterTrack {
    CGRect rect = CGRectMake([self leftTrackDividerXPosition], 
               self.bounds.size.height / 2 - _centerTrackImageView.image.size.height / 2, 
               [self rightTrackDividerXPosition] - [self leftTrackDividerXPosition],
               _centerTrackImageView.image.size.height);
//    NSLog(@"frameForCenterTrack: (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    return rect;

}

- (CGRect)frameForRightTrack {
    CGRect rect = CGRectMake([self rightTrackDividerXPosition], 
               self.bounds.size.height / 2 - _rightTrackImageView.image.size.height / 2, 
               self.bounds.size.width - [self rightTrackDividerXPosition],
               _rightTrackImageView.image.size.height);
//    NSLog(@"frameForRightTrack: (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    return rect;

}

- (CGFloat)leftTrackDividerXPosition {
    if (_leftValue == _min) return 0;
    else if (_leftValue == _max) return self.bounds.size.width;
    else return round([self leftThumbPosition].x);
}

- (CGFloat)rightTrackDividerXPosition {
    if (_rightValue == _min) return 0;
    else if (_rightValue == _max) return self.bounds.size.width;
    else return [self rightThumbPosition].x;    
}

- (void)configureTrackView:(UIImageView *)trackView toClipWithContentMode:(UIViewContentMode)mode {
    if (trackView.frame.size.width < trackView.image.size.width) {
        trackView.contentMode = mode;
    }
    else {
        trackView.contentMode = UIViewContentModeScaleToFill;
    }    
}

- (void)layoutImageSubviews {
    [self layoutTracks];
    [self layoutThumbs];
    [self bringAppropriateThumbToFront];
    [self showAppropriateThumbsForState];
}

- (void)layoutTracks {
    if (_leftValue == _min && _rightValue == _max) {
        _centerTrackImageView.image = [self fullCenterTrackImageForState];
    }
    else if (_leftValue == _min && _rightValue == _min) {
        _rightTrackImageView.image = [self fullRightTrackImageForState];
    }
    else if (_leftValue == _max && _rightValue == _max) {
        _leftTrackImageView.image = [self fullLeftTrackImageForState];
    }
    else if (_leftValue == _min) {
        _centerTrackImageView.image = [self leftTwoThirdsOfCenterTrackImageForState];
        _rightTrackImageView.image = [self rightHalfOfRightTrackImageForState];        
    }
    else if (_rightValue == _max) {
        _leftTrackImageView.image = [self leftHalfOfLeftTrackImageForState];
        _centerTrackImageView.image = [self rightTwoThirdsOfCenterTrackImageForState];
    }
    else {
        _leftTrackImageView.image = [self leftHalfOfLeftTrackImageForState];
        _centerTrackImageView.image = [self centerThirdOfCenterTrackImageForState];
        _rightTrackImageView.image = [self rightHalfOfRightTrackImageForState];        
    }    
    
    if (_leftTrackImageView) {
        _leftTrackImageView.frame = [self frameForLeftTrack];
        [self configureTrackView:_leftTrackImageView 
           toClipWithContentMode:UIViewContentModeLeft];
    }
    if (_centerTrackImageView) {
        _centerTrackImageView.frame = [self frameForCenterTrack];
        [self configureTrackView:_centerTrackImageView 
           toClipWithContentMode:UIViewContentModeCenter];
    }
    if (_rightTrackImageView) {
        _rightTrackImageView.frame = [self frameForRightTrack];
        [self configureTrackView:_rightTrackImageView 
           toClipWithContentMode:UIViewContentModeRight];
    }
}

- (UIImage *)fullCenterTrackImageForState {
    if (_disabled) {
        return _disabledCenterTrackImageFull;
    }
    else if (_dragging) {
        return _highlightedCenterTrackImageFull;
    }
    else {
        return _centerTrackImageFull;
    }
}

- (UIImage *)leftTwoThirdsOfCenterTrackImageForState {
    if (_disabled) {
        return _disabledCenterTrackImageLeft;
    }
    else if (_dragging && _thumbBeingDragged == THUMB_RIGHT) {
        return _highlightedCenterTrackImageLeft;
    }
    else {
        return _centerTrackImageLeft;
    }
}

- (UIImage *)centerThirdOfCenterTrackImageForState {
    if (_disabled) {
        return _disabledCenterTrackImageCenter;
    }
    else if (_dragging) {
        return _highlightedCenterTrackImageCenter;
    }
    else {
        return _centerTrackImageCenter;
    }
}

- (UIImage *)rightTwoThirdsOfCenterTrackImageForState {
    if (_disabled) {
        return _disabledCenterTrackImageRight;
    }
    else if (_dragging && _thumbBeingDragged == THUMB_LEFT) {
        return _highlightedCenterTrackImageRight;
    }
    else {
        return _centerTrackImageRight;
    }
}

- (UIImage *)fullLeftTrackImageForState {
    if (_disabled) {
        return _disabledLeftTrackImageFull;
    }
    else if (_dragging && _thumbBeingDragged == THUMB_LEFT) {
        return _highlightedLeftTrackImageFull;
    }
    else {
        return _leftTrackImageFull;
    }
}

- (UIImage *)leftHalfOfLeftTrackImageForState {
    if (_disabled) {
        return _disabledLeftTrackImageLeft;
    }
    else if (_dragging && _thumbBeingDragged == THUMB_LEFT) {
        return _highlightedLeftTrackImageLeft;
    }
    else {
        return _leftTrackImageLeft;
    }
}

- (UIImage *)fullRightTrackImageForState {
    if (_disabled) {
        return _disabledRightTrackImageFull;
    }
    else if (_dragging && _thumbBeingDragged == THUMB_RIGHT) {
        return _highlightedRightTrackImageFull;
    }
    else {
        return _rightTrackImageFull;
    }
}

- (UIImage *)rightHalfOfRightTrackImageForState {
    if (_disabled) {
        return _disabledRightTrackImageRight;
    }
    else if (_dragging && _thumbBeingDragged == THUMB_RIGHT) {
        return _highlightedRightTrackImageRight;
    }
    else {
        return _rightTrackImageRight;
    }
}

- (void)showAppropriateThumbsForState {
    if (_disabled) {
        _disabledLeftThumbImageView.hidden = NO;
        _disabledRightThumbImageView.hidden = NO;
        _leftThumbImageView.hidden = YES;
        _rightThumbImageView.hidden = YES;
        _highlightedLeftThumbImageView.hidden = YES;
        _highlightedRightThumbImageView.hidden = YES;
    }
    else if (_dragging) {
        if (_thumbBeingDragged == THUMB_LEFT) {
            if (_highlightedLeftThumbImageView) {
                _highlightedLeftThumbImageView.hidden = NO;
                _leftThumbImageView.hidden = YES;
            }
            else {
                _leftThumbImageView.hidden = NO;
            }
        }
        else {
            if (_highlightedRightThumbImageView) {
                _highlightedRightThumbImageView.hidden = NO;
                _rightThumbImageView.hidden = YES;
            }
            else {
                _rightThumbImageView.hidden = NO;
            }
        }
        _disabledLeftThumbImageView.hidden = YES;
        _disabledRightThumbImageView.hidden = YES;
    }
    else {
        _leftThumbImageView.hidden = NO;
        _rightThumbImageView.hidden = NO;
        _highlightedLeftThumbImageView.hidden = YES;
        _highlightedRightThumbImageView.hidden = YES;
        _disabledLeftThumbImageView.hidden = YES;
        _disabledRightThumbImageView.hidden = YES;
    }
}

- (void)layoutThumbs {
    if (_leftThumbImageView) {
        [_leftThumbImageView sizeToFit];
        _leftThumbImageView.center = [self leftThumbPosition];
    }
    if (_rightThumbImageView) {
        [_rightThumbImageView sizeToFit];
        _rightThumbImageView.center = [self rightThumbPosition];
    }
    if (_highlightedLeftThumbImageView) {
        [_highlightedLeftThumbImageView sizeToFit];
        _highlightedLeftThumbImageView.center = [self leftThumbPosition];
    }
    if (_highlightedRightThumbImageView) {
        [_highlightedRightThumbImageView sizeToFit];
        _highlightedRightThumbImageView.center = [self rightThumbPosition];
    }
    if (_disabledLeftThumbImageView) {
        [_disabledLeftThumbImageView sizeToFit];
        _disabledLeftThumbImageView.center = [self leftThumbPosition];
    }
    if (_disabledRightThumbImageView) {
        [_disabledRightThumbImageView sizeToFit];
        _disabledRightThumbImageView.center = [self rightThumbPosition];
    }
}

- (void)bringAppropriateThumbToFront {
    if (_thumbBeingDragged == THUMB_RIGHT) {
        [self.wrapperView bringSubviewToFront:_leftThumbImageView];
        [self.wrapperView bringSubviewToFront:_highlightedLeftThumbImageView];
        [self.wrapperView bringSubviewToFront:_rightThumbImageView];
        [self.wrapperView bringSubviewToFront:_highlightedRightThumbImageView];
    }
    else {
        [self.wrapperView bringSubviewToFront:_rightThumbImageView];
        [self.wrapperView bringSubviewToFront:_highlightedRightThumbImageView];
        [self.wrapperView bringSubviewToFront:_leftThumbImageView];
        [self.wrapperView bringSubviewToFront:_highlightedLeftThumbImageView];
    }
}

- (CGFloat)normalizedLeftValue {
    if (_max - _min != 0) {
        return (_leftValue - _min) / (_max - _min);
    }
    else {
        return 0;
    }
}

- (CGFloat)normalizedRightValue {
    if (_max - _min != 0) {
        return (_rightValue - _min) / (_max - _min);
    }
    else {
        return 0;
    }
}

- (CGPoint)leftThumbPosition {
    return CGPointMake([self normalizedLeftValue] * [self activeTrackWidth] + [self minLocation].x, 
                       self.bounds.size.height / 2);
}

- (CGPoint)rightThumbPosition {
    return CGPointMake([self normalizedRightValue] * [self activeTrackWidth] + [self minLocation].x, 
                       self.bounds.size.height / 2);
}

// The width of the segment of the track between its max and min positions
// The left and right ends of the track are outside this range.
// The width of the inactive portion is 1/2 the width of the thumb image for that side.
- (CGFloat)activeTrackWidth {
    CGFloat activeTrackWidth = self.bounds.size.width;
    if ([self leftThumbViewToUseForTrackSizing]) {
        activeTrackWidth -= [self leftThumbViewToUseForTrackSizing].frame.size.width / 2;
    }
    if ([self rightThumbViewToUseForTrackSizing]) {
        activeTrackWidth -= [self rightThumbViewToUseForTrackSizing].frame.size.width / 2;
    }
    return activeTrackWidth;
}

- (UIImageView *)leftThumbViewToUseForTrackSizing {
    if (_leftThumbImageView && _highlightedLeftThumbImageView) {
        if (_leftThumbImageView.frame.size.width >= _highlightedLeftThumbImageView.frame.size.width) {
            return _leftThumbImageView;
        }
        else {
            return _highlightedLeftThumbImageView;
        }
    }
    else if (_leftThumbImageView) {
        return _leftThumbImageView;
    }
    else if (_highlightedLeftThumbImageView) {
        return _highlightedLeftThumbImageView;
    }
    else return nil;
}

- (UIImageView *)rightThumbViewToUseForTrackSizing {
    if (_rightThumbImageView && _highlightedRightThumbImageView) {
        if (_rightThumbImageView.frame.size.width >= _highlightedRightThumbImageView.frame.size.width) {
            return _rightThumbImageView;
        }
        else {
            return _highlightedRightThumbImageView;
        }
    }
    else if (_rightThumbImageView) {
        return _rightThumbImageView;
    }
    else if (_highlightedRightThumbImageView) {
        return _highlightedRightThumbImageView;
    }
    else return nil;
}

- (CGPoint)minLocation {
    if ([self leftThumbViewToUseForTrackSizing]) {
        return CGPointMake([self leftThumbViewToUseForTrackSizing].frame.size.width / 2, 0);
    }
    else {
        return CGPointMake(0.0, 0.0);
    }
}

- (CGPoint)maxLocation {
    if ([self rightThumbViewToUseForTrackSizing]) {
        return CGPointMake(self.bounds.size.width - 
                           [self rightThumbViewToUseForTrackSizing].frame.size.width / 2, 
                           0);
    }
    else {
        return CGPointMake(self.bounds.size.width, 0.0);
    }
}

- (BOOL)touchIsOnLeftThumb:(UITouch *)touch {
    return ([self touchIsCloserToLeftThumb:touch] &&
            [self distanceToLeftThumb:touch] < [self leftThumbTouchRadius]);
}

- (BOOL)touchIsOnRightThumb:(UITouch *)touch {
    return ([self touchIsCloserToRightThumb:touch] &&
            [self distanceToRightThumb:touch] < [self rightThumbTouchRadius]);
}

- (BOOL)touchIsCloserToLeftThumb:(UITouch *)touch {
    return ([touch locationInView:self].x < [self rightThumbPosition].x &&
            [self distanceToLeftThumb:touch] <= [self distanceToRightThumb:touch]);
}

- (BOOL)touchIsCloserToRightThumb:(UITouch *)touch {
    return ![self touchIsCloserToLeftThumb:touch];
}

- (CGFloat)distanceToLeftThumb:(UITouch *)touch {
    return [self distanceForRise:[touch locationInView:self].y - [self leftThumbPosition].y 
                             run:[touch locationInView:self].x - [self leftThumbPosition].x];
}

- (CGFloat)distanceToRightThumb:(UITouch *)touch {
    return [self distanceForRise:[touch locationInView:self].y - [self rightThumbPosition].y 
                             run:[touch locationInView:self].x - [self rightThumbPosition].x];
}

- (CGFloat)leftThumbTouchRadius {
    return MAX([self humanFingerRadius], [self distanceFromCenterToCorner:_leftThumbImageView]);
}

- (CGFloat)rightThumbTouchRadius {
    return MAX([self humanFingerRadius], [self distanceFromCenterToCorner:_rightThumbImageView]);
}

- (CGFloat)humanFingerRadius {
    return 20.0f;
}

- (CGFloat)distanceFromCenterToCorner:(UIView *)aView {
    if (aView) {
        return [self distanceForRise:aView.frame.size.height / 2 
                                 run:aView.frame.size.width / 2];
    }
    else {
        return 0.0f;
    }
}

- (CGFloat)distanceForRise:(CGFloat)rise run:(CGFloat)run {
    return sqrt(pow(rise, 2) + pow(run, 2));
}

- (void)startLeftDrag:(UITouch *)touch {
    _dragging = YES;
    _thumbBeingDragged = THUMB_LEFT;
    _thumbStartLocation = [self leftThumbPosition];
    _dragStartLocation = [touch locationInView:self];
    _dragStartValue = _leftValue;
    [self layoutImageSubviews];
    [self touchStartedForThumbWithIndex:0 value:_leftValue];
}

- (void)startRightDrag:(UITouch *)touch {
    _dragging = YES;
    _thumbBeingDragged = THUMB_RIGHT;
    _thumbStartLocation = [self rightThumbPosition];
    _dragStartLocation = [touch locationInView:self];
    _dragStartValue = _rightValue;
    [self layoutImageSubviews];
    [self touchStartedForThumbWithIndex:1 value:_rightValue];
}

- (void)updateDrag:(UITouch *)touch {
    if (_dragging) {
        if (_thumbBeingDragged == THUMB_LEFT) {
            _leftValue = [self valueForLocation:[self clippedLocationForTouchDelta:touch]];
            [self layoutImageSubviews];
            [self valueChangedForThumbWithIndex:0 value:_leftValue];
        }
        else {
            _rightValue = [self valueForLocation:[self clippedLocationForTouchDelta:touch]];
            [self layoutImageSubviews];
            [self valueChangedForThumbWithIndex:1 value:_rightValue];
        }
    }
}

- (void)endDrag:(UITouch *)touch {
    NSInteger thumbIndex = _thumbBeingDragged - 1;
    if (_dragging) {
        [self updateDrag:touch];
        _dragging = NO;
        _thumbBeingDragged = THUMB_NONE;
        [self layoutImageSubviews];
        if (thumbIndex == 0) {
            [self touchEndedForThumbWithIndex:0 value:_leftValue];
        }
        else {
            [self touchEndedForThumbWithIndex:1 value:_rightValue];
        }
    }
}

- (CGPoint)clippedLocationForTouchDelta:(UITouch *)touch {
    if (_thumbBeingDragged == THUMB_LEFT) {
        if ([self unclippedLocationForTouchDelta:touch].x > [self rightThumbPosition].x) {
            return [self rightThumbPosition];
        }
        else if ([self unclippedLocationForTouchDelta:touch].x < [self minLocation].x) {
            return [self minLocation];
        }
        else {
            return [self unclippedLocationForTouchDelta:touch];
        }
    }
    else {
        if ([self unclippedLocationForTouchDelta:touch].x < [self leftThumbPosition].x) {
            return [self leftThumbPosition];
        }
        else if ([self unclippedLocationForTouchDelta:touch].x > [self maxLocation].x) {
            return [self maxLocation];
        }
        else {
            return [self unclippedLocationForTouchDelta:touch];
        }
    }
}

- (CGFloat)valueForLocation:(CGPoint)location {
    CGFloat deltaX = location.x - _thumbStartLocation.x;
    return _dragStartValue + deltaX * [self valuePerPoint];
}

- (CGFloat)valuePerPoint {
    if ([self activeTrackWidth] > 0) {
        return (_max - _min) / [self activeTrackWidth];
    }
    else {
        return 0;
    }
}

- (CGPoint)unclippedLocationForTouchDelta:(UITouch *)touch {
    return CGPointMake(_thumbStartLocation.x + ([touch locationInView:self].x -
                                                _dragStartLocation.x), 
                       _thumbStartLocation.y);
}

- (void)touchStartedForThumbWithIndex:(NSInteger)index value:(CGFloat)value  {
	NSNumber * newValue = [NSNumber numberWithFloat:value];
    NSNumber * thumbIndex = [NSNumber numberWithInteger:index];
	[self.proxy replaceValue:newValue forKey:[self proxyKeyForThumbWithIndex:index] notification:NO];
	
	if ([self.proxy _hasListeners:@"touchstart"])
	{
		[self.proxy fireEvent:@"touchstart" withObject:[NSDictionary dictionaryWithObjectsAndKeys:newValue, @"value", thumbIndex, @"thumbIndex", nil]];
	}
}

- (void)touchStartedNotOnThumb {
    if ([self.proxy _hasListeners:@"touchstart"])
	{
		[self.proxy fireEvent:@"touchstart" withObject:[NSDictionary dictionaryWithObjectsAndKeys:nil]];
	}
}

- (void)valueChangedForThumbWithIndex:(NSInteger)index value:(CGFloat)value  {
	NSNumber * newValue = [NSNumber numberWithFloat:value];
    NSNumber * thumbIndex = [NSNumber numberWithInteger:index];
	[self.proxy replaceValue:newValue forKey:[self proxyKeyForThumbWithIndex:index] notification:NO];
	
	if ([self.proxy _hasListeners:@"change"])
	{
		[self.proxy fireEvent:@"change" withObject:[NSDictionary dictionaryWithObjectsAndKeys:newValue, @"value", thumbIndex, @"thumbIndex", nil]];
	}
}

- (void)touchEndedForThumbWithIndex:(NSInteger)index value:(CGFloat)value  {
	NSNumber * newValue = [NSNumber numberWithFloat:value];
    NSNumber * thumbIndex = [NSNumber numberWithInteger:index];	
	[self.proxy replaceValue:newValue forKey:[self proxyKeyForThumbWithIndex:index] notification:NO];

	if ([self.proxy _hasListeners:@"touchend"])
	{
		[self.proxy fireEvent:@"touchend" withObject:[NSDictionary dictionaryWithObjectsAndKeys:newValue, @"value", thumbIndex, @"thumbIndex", nil]];
	}
}

- (void)touchEndedNotOnThumb {
    if ([self.proxy _hasListeners:@"touchend"])
	{
		[self.proxy fireEvent:@"touchend" withObject:[NSDictionary dictionaryWithObjectsAndKeys:nil]];
	}
}

- (NSString *)proxyKeyForThumbWithIndex:(NSInteger)index {
    return index == 0 ? @"leftValue" : @"rightValue";
}


@end
