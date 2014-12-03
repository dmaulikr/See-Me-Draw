//
//  ViewController.h
//  See Me Draw
//
//  Created by Ian on 17/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "aDot.h"
#import "movingDot.h"
#import "dotSet.h"

@interface ViewController : UIViewController <AVAudioPlayerDelegate> {
	BOOL isDrawing;
	CGPoint lastPoint;
	NSInteger activeDot;
	NSMutableArray *dotCollection;
	movingDot *hintDot;
	NSInteger currentLoop;
	NSInteger lastPic;
	BOOL completedPic;
	NSInteger currentTouch;
}
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) IBOutlet UIView *masterView;
@property (weak, nonatomic) IBOutlet UIImageView *chosenImage;

@end
