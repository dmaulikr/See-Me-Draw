//
//  dotSet.h
//  See Me Draw
//
//  Created by Ian on 27/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DOT_SET_COUNT 10

@interface dotSet : NSObject {
	NSMutableArray *collection;
	NSString *imageName;
}
- (id) init:(NSInteger)imageNo;
@property NSMutableArray *collection;
@property NSString *imageName;
@end
