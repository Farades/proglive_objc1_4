//
//  Ellipse.m
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "Ellipse.h"

@implementation Ellipse
-(id)initWithSemimajorAxis:(float)semimajorAxis semiminorAxis:(float)semiminorAxis {
    self = [self init];
    if (self) {
        _semimajorAxis = semimajorAxis;
        _semiminorAxis  = semiminorAxis;
    }
    return self;
}

-(id)initWithRandom {
    self = [self init];
    if (self) {
        _semimajorAxis  = [self randomFloatBetween:5 and:10];
        _semiminorAxis = [self randomFloatBetween:5 and:10];
        next    = nil;
    }
    return self;
}

-(float)square {
    return M_PI * _semimajorAxis * _semiminorAxis;
}

-(float)perimeter {
    return 2 * M_PI * sqrt( (pow(_semimajorAxis, 2) +  pow(_semiminorAxis, 2)) / 2 );
}

-(NSString*)toString {
    NSString* res = [[NSString alloc] init];
    res = [NSString stringWithFormat:@"Ellipse: semimajor = %.2f, semiminor = %.2f, S = %.2f, P = %.2f", _semimajorAxis, _semiminorAxis, [self square], [self perimeter]];
    return res;
}

@end
