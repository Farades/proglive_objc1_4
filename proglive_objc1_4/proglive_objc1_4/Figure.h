//
//  Figure.h
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Figure : NSObject {
@public
    float _width;
    float _height;
    Figure* next;
}
- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber;
-(id)initWithRandom;
-(float)square;
-(float)perimeter;
-(NSString*)toString;
@end
