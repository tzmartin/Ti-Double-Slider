//
//  ComSemanticpressTidoublesliderSlider.h
//  tidoubleslider
//
//  Created by Curtis Duhn on 9/9/11.
//   Copyright (c) 2012 by Semantic Press, Inc. All rights reserved.
//

#import "TiUIView.h"

typedef enum DragThumb {
    THUMB_NONE,
    THUMB_LEFT,
    THUMB_RIGHT
} DragThumb;

@interface ComSemanticpressTidoublesliderSlider : TiUIView {
    CGFloat _min;
    CGFloat _max;
    CGFloat _leftValue;
    CGFloat _rightValue;
    BOOL _dragging;
    DragThumb _thumbBeingDragged;
    CGPoint _thumbStartLocation;
    CGPoint _dragStartLocation;
    CGFloat _dragStartValue;
    BOOL _disabled;
}

@end
