//
//  aDot.m
//  DrawAssist
//
//  Created by Ian on 16/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "aDot.h"

@implementation aDot

@synthesize lessDone;
@synthesize moreDone;
@synthesize dotLess;
@synthesize dotMore;

- (id)initWithFrame:(CGRect)frame inView:(UIView *)inView dotImagePath:(NSString *)dotImagePath
{
    self = [super initWithFrame:frame];
    if (self) {
		lessDone=NO;
		moreDone=NO;	
		[self setBackgroundColor:[UIColor clearColor]];
		[self setImage:[UIImage imageWithContentsOfFile:dotImagePath]];
		[inView addSubview:self];
    }
    return self;
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
