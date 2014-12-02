//
//  movingDot.h
//  See Me Draw
//
//  Created by Ian on 17/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface movingDot : UIImageView {
	float moveX;
	float moveY;
	float sX;
	float sY;
	float eX;
	float eY;
	NSTimer *refreshTime;
}
- (id) initWithFrame:(CGRect)frame endRect:(CGRect)frameEnd inView:(UIView *)inView dotImagePath:(NSString *)dotImagePath;
- (void) replaceDot:(CGRect)frameStart endRect:(CGRect)frameEnd;
- (void) stopDot;
@end
