//
//  Figure.m
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import "Figure.h"

@implementation Figure

-(id)initWithRandom {
    self = [self init];
    if (self) {
        _width  = [self randomFloatBetween:5 and:10];
        _height = [self randomFloatBetween:5 and:10];
        next    = nil;
    }
    return self;
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

-(float)square {
    return 0;
}

-(float)perimeter {
    return 0;
}

-(NSString*)toString {
    return nil;
}
@end
