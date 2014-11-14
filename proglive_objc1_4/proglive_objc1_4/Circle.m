//
//  Circle.m
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "Circle.h"

@implementation Circle
-(id)initWithRadius:(float)radius {
    self = [self init];
    if (self) {
        _radius = radius;
    }
    return self;
}

-(id)initWithRandom {
    self = [self init];
    if (self) {
        _radius  = [self randomFloatBetween:5 and:10];
        next     = nil;
    }
    return self;
}

-(float)square {
    return M_PI * pow(_radius, 2);
}

-(float)perimeter {
    return 2 * M_PI * _radius;
}

-(NSString*)toString {
    NSString* res = [[NSString alloc] init];
    res = [NSString stringWithFormat:@"Circle:    S = %.2f, Radius = %.2f, L = %.2f", [self square], _radius, [self perimeter]];
    return res;
}

@end
