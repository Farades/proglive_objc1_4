//
//  Rectangle.m
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
-(id)initWithHeight:(float)height width:(float)width {
    self = [self init];
    if (self) {
        _height = height;
        _width  = width;
    }
    return self;
}

-(id)initWithRandom {
    self = [self init];
    if (self) {
        _width  = [self randomFloatBetween:5 and:10];
        _height = [self randomFloatBetween:5 and:10];
        next    = nil;
    }
    return self;
}

-(float)square {
    return _width * _height;
}

-(float)perimeter {
    return 2 * (_width + _height);
}

-(NSString*)toString {
    NSString* res = [[NSString alloc] init];
    res = [NSString stringWithFormat:@"Rectangle: S = %.2f, Width = %.2f, Height = %.2f, P = %.2f", [self square], _width, _height, [self perimeter]];
    return res;
}

@end
