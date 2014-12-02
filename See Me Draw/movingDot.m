//
//  movingDot.m
//  See Me Draw
//
//  Created by Ian on 17/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "movingDot.h"
static inline float rwAngle(CGRect a, CGRect b) {
	float aX,aY,bX,bY;
	aX=a.origin.x;
	aY=a.origin.y;
	bX=b.origin.x;
	bY=b.origin.y;
	float dX=abs(aX-bX);
	float dY=abs(aY-bY);
	float aTan=atan(dY/dX);
	return -1*aTan;
}
@implementation movingDot

- (id)initWithFrame:(CGRect)frame endRect:(CGRect)frameEnd inView:(UIView *)inView dotImagePath:(NSString *)dotImagePath
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor clearColor]];
		[self setImage:[UIImage imageWithContentsOfFile:dotImagePath]];
		[inView addSubview:self];
		refreshTime = [NSTimer scheduledTimerWithTimeInterval:0.1
																target:self
															  selector:@selector(moveDot:)
															  userInfo:nil
															   repeats:YES];
	
		[self speedOfDot:frame  endRect:frameEnd];
    }
    return self;
}

-(void)replaceDot:(CGRect)frameStart endRect:(CGRect)frameEnd {
	CGRect newPosition = CGRectMake(frameStart.origin.x,frameStart.origin.y,30,30);
	[self setFrame:newPosition];
	[self speedOfDot:frameStart	endRect:frameEnd];
}

-(void)stopDot {
	[refreshTime invalidate];
	[self setHidden:YES];
}

-(void)speedOfDot:(CGRect)frameStart endRect:(CGRect)frameEnd {
	if (frameStart.origin.x==frameEnd.origin.x) {
		moveX=0;
		moveY=5;
	} else {
		if (frameStart.origin.y==frameEnd.origin.y) {
			moveX=5;
			moveY=0;
		} else {
			float distX=5*cos(rwAngle(frameStart, frameEnd));
			float distY=5*sin(rwAngle(frameStart, frameEnd));
			if (frameStart.origin.x<frameEnd.origin.x) {
				distX*=-1;
			}
			if (frameStart.origin.y>frameEnd.origin.y) {
				distX*=-1;
			}
			moveX=distX;
			moveY=distY;
		}
	}
	
	if ((frameStart.origin.x > frameEnd.origin.x)&&(moveX>0)) {
		moveX*=-1;
	}
	if ((frameStart.origin.x < frameEnd.origin.x)&&(moveX<0)) {
		moveX*=-1;
	}
	if ((frameStart.origin.y > frameEnd.origin.y)&&(moveY>0)) {
		moveY*=-1;
	}
	if ((frameStart.origin.y < frameEnd.origin.y)&&(moveY<0)) {
		moveY*=-1;
	}
	
	sX=frameStart.origin.x;
	sY=frameStart.origin.y;
	eX=frameEnd.origin.x;
	eY=frameEnd.origin.y;
}

- (void)moveDot:(NSTimer*)theTimer {
	float newX,newY;
	newX=self.frame.origin.x+moveX;
	newY=self.frame.origin.y+moveY;
	if (eX > sX) {
		if (newX>eX) {
			newX=sX;
		}
	} else {
		if (eX < sX) {
			if (newX<eX) {
				newX=sX;
			}
		}
	}
	if (eY > sY) {
		if (newY>eY) {
			newY=sY;
		}
	} else {
		if (eY < sY) {
			if (newY<eY) {
				newY=sY;
			}
		}
	}
	CGRect newPosition = CGRectMake(newX,newY,30,30);
	[self setFrame:newPosition];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
