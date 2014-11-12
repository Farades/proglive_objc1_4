//
//  Rectangle.h
//  proglive_objc1_4
//
//  Created by admin on 12.11.14.
//  Copyright (c) 2014 farades. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

@interface Rectangle : Figure {
@public

}

-(id)initWithHeight:(float)height width:(float)width;
-(id)initWithRandom;
-(NSString*)toString;

@end
