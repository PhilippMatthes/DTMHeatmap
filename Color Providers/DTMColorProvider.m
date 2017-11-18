//
//  ColorProvider.m
//  DTMHeatMapExample
//
//  Created by Bryan Oltman on 1/8/15.
//  Copyright (c) 2015 Dataminr. All rights reserved.
//

#import "DTMColorProvider.h"

@implementation DTMColorProvider

static CGFloat maxRed = 1.0;
static CGFloat maxGreen = 1.0;
static CGFloat maxBlue = 1.0;

- (void)red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    maxRed = red;
    maxGreen = green;
    maxBlue = blue;
}

- (void)colorForValue:(double)value
                  red:(CGFloat *)red
                green:(CGFloat *)green
                 blue:(CGFloat *)blue
                alpha:(CGFloat *)alpha
{
    static int maxVal = 255;
    if (value > 1) {
        value = 1;
    }
    
    value = sqrt(value);
    
    if (value < kSBAlphaPivotY) {
        *alpha = value * kSBAlphaPivotY / kSBAlphaPivotX;
    } else {
        *alpha = kSBAlphaPivotY + ((kSBMaxAlpha - kSBAlphaPivotY) / (1 - kSBAlphaPivotX)) * (value - kSBAlphaPivotX);
    }
    
    
    
    //formula converts a number from 0 to 1.0 to an rgb color.
    //uses MATLAB/Octave colorbar code
    
    
    *alpha *= maxVal;
    *red = value * maxRed;
    *green = value * maxGreen;
    *blue = value * maxBlue;
}

@end
