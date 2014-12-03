//
//  aDot.h
//  DrawAssist
//
//  Created by Ian on 16/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aDot : UIImageView {
	BOOL lessDone;
	BOOL moreDone;
	aDot *dotLess;
	aDot *dotMore;
}
- (id)initWithFrame:(CGRect)frame inView:(UIView *)inView dotImagePath:(NSString *)dotImagePath;
@property BOOL lessDone;
@property BOOL moreDone;
@property aDot *dotLess;
@property aDot *dotMore;
@end
