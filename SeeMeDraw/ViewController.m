//
//  ViewController.m
//  See Me Draw
//
//  Created by Ian on 17/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    AVAudioPlayer *playerSuccess01;
	AVAudioPlayer *playerSuccess02;
	AVAudioPlayer *playerSuccess03;
	AVAudioPlayer *playerSuccess04;
	AVAudioPlayer *playerLoop1;
	AVAudioPlayer *playerLoop2;
	AVAudioPlayer *playerLoop3;
	AVAudioPlayer *playerLoop4;
}

@end

@implementation ViewController

@synthesize mainImage;
@synthesize tempDrawImage;
@synthesize chosenImage;
@synthesize masterView;

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Property lastPic set to 0 for "none". Used to prevent the same picture coming up twice in a row
	lastPic=0;
	// Property currentTouch set to -1, repesenting "no current touch".
	// Property lastPoint.x set to -1, representing "no last point (because there's no current touch).
	currentTouch=-1;
	lastPoint.x=-1;
	// Set the property currentLoop to 1, just to make sure that it's set to a valid value. Should be set before
	// any of the loops for user touching screen to join dots anyway.
	currentLoop=1;
	// Set the completedPic to be NO, just to make sure
	completedPic=NO;
	
	// Choose the first picture & draw the first dot-to-dot.
	[self chooseFirstPicture];
	
	// Set the path up for the players that are  going to play the congratulations tunes
    NSString *pathSuccess;
    pathSuccess = [[NSBundle mainBundle] pathForResource:@"success01" ofType:@"mp3"];
    playerSuccess01 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathSuccess] error:nil];
    pathSuccess = [[NSBundle mainBundle] pathForResource:@"success02" ofType:@"mp3"];
    playerSuccess02 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathSuccess] error:nil];
    pathSuccess = [[NSBundle mainBundle] pathForResource:@"success03" ofType:@"mp3"];
    playerSuccess03 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathSuccess] error:nil];
    pathSuccess = [[NSBundle mainBundle] pathForResource:@"success04" ofType:@"mp3"];
    playerSuccess04 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathSuccess] error:nil];
	
	// Set the path for each of the players that play sounds when user is touching screen to join two dots.
    NSString *pathLoop1;
    pathLoop1 = [[NSBundle mainBundle] pathForResource:@"Loop1" ofType:@"mp3"];
    playerLoop1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathLoop1] error:nil];
	
    NSString *pathLoop2;
	pathLoop2 = [[NSBundle mainBundle] pathForResource:@"Loop2" ofType:@"mp3"];
    playerLoop2 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathLoop2] error:nil];

    NSString *pathLoop3;
	pathLoop3 = [[NSBundle mainBundle] pathForResource:@"Loop3" ofType:@"mp3"];
    playerLoop3 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathLoop3] error:nil];
	
    NSString *pathLoop4;
	pathLoop4 = [[NSBundle mainBundle] pathForResource:@"Loop4" ofType:@"mp3"];
    playerLoop4 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathLoop4] error:nil];
	
}

// Wrapper functions to choose the next image and draw the dot pattern
// chooseFirstPicture is used for viewDidLoad, whilst chooseNewPicture is called once timer expires after completing
// previous picture
// chooseActualPicture is the method that randomly picks an image and calls the sub-method to set that image up.
- (void) chooseFirstPicture {
	[self chooseActualPicture];
}


- (void) chooseNewPicture {
	if (completedPic==YES) {
		[self chooseActualPicture];
	}
}

- (void) chooseActualPicture {
	int randPic;
	while ((randPic=rand() % DOT_SET_COUNT + 1)==lastPic);
	lastPic=randPic;
	
	completedPic=NO;
	
	// Create a new instance of a dotSet for the random picture chosen. dotSet includes an array of rectangles for the
	// dots and the name of the image to display at the end.
	dotSet *newDotSet = [[dotSet alloc] init:randPic];

	// Set up properties. isDrawing is set to NO as the user isn't drawing at the start, activeDot is set to 0 (no dot
	// active) and the points of the image are save to the object.
	isDrawing=NO;
	activeDot=0;
	dotCollection=[NSMutableArray arrayWithObjects:nil count:0];
	
	// Get the image for the dot of the dot-to-dot
	NSString *dotImage = [[NSBundle mainBundle] pathForResource:@"dotRed" ofType:@"png"];

	// Add a new entry to the dot collection. Each entry is a new dot object, positioned as per the points above.
	for (int dIdx=0; dIdx<newDotSet.collection.count; dIdx++) {
		[dotCollection addObject:[[aDot alloc] initWithFrame:[[newDotSet.collection objectAtIndex:dIdx] CGRectValue] inView:self.view dotImagePath:dotImage]];
	}
	
	// set the image for the hint dot that will highlight first two dots to join
	// Create the first hint dot.
	NSString *arrowImage = [[NSBundle mainBundle] pathForResource:@"dotGreen" ofType:@"png"];
	hintDot = [[movingDot alloc] initWithFrame:[[newDotSet.collection objectAtIndex:0] CGRectValue] endRect:[[newDotSet.collection objectAtIndex:1] CGRectValue] inView:self.view dotImagePath:arrowImage];
	
	// set the image of the hidden view that will display the picture once all dots are completed. Set the alpha of the
	// image to zero so that it is hidden.
	NSString *whichImage = [[NSBundle mainBundle] pathForResource:[newDotSet imageName] ofType:@"jpg"];
	[chosenImage setImage:[UIImage imageWithContentsOfFile:whichImage]];
	[chosenImage setAlpha:0.0f];
	
	// Go through each dot in the collection of dots and set the previous dot and next dot pointers to the previous/next
	// dot in the collection.
	aDot *setDot;
	
	NSInteger dCnt=[dotCollection count];
	for (int dIdx=0;dIdx<dCnt;dIdx++) {
		setDot=dotCollection[dIdx];
		if (dIdx==0) {
			setDot.dotLess=dotCollection[dCnt-1];
		} else {
			setDot.dotLess=dotCollection[dIdx-1];
		}
		if (dIdx>=dCnt - 1) {
			setDot.dotMore=dotCollection[0];
		} else {
			setDot.dotMore= dotCollection[dIdx+1];
		}
	}
}

// Method to determine that all the dots have been joined up.
-(BOOL)allDotsDone {
	NSInteger dCnt=[dotCollection count];
	aDot *testDot;
	for (int dIdx=0; dIdx<dCnt;dIdx++) {
		testDot=dotCollection[dIdx];
		if ((testDot.lessDone==NO)||(testDot.moreDone==NO)) {
			return NO;
		}
	}
	
	return YES;
}

// Method to find the first dit that hasn't been joined to both its previous and its next dot.
-(NSInteger) nextDotToDo {
	NSInteger dCnt=[dotCollection count];
	aDot *testDot;
	for (int dIdx=0; dIdx<dCnt;dIdx++) {
		testDot=dotCollection[dIdx];
		if (testDot.moreDone==NO) {
			return dIdx;
		}
	}

	return -1;
}


-(NSInteger)inDotN:(CGPoint)whereTouch {
	aDot *testDot;
	
	for (int dIdx=0; dIdx<dotCollection.count; dIdx++) {
		testDot=dotCollection[dIdx];
		if ((whereTouch.x>=testDot.frame.origin.x)&&
			(whereTouch.x<=testDot.frame.origin.x+testDot.frame.size.width)&&
			(whereTouch.y>=testDot.frame.origin.y)&&
			(whereTouch.y<=testDot.frame.origin.y+testDot.frame.size.height)) {
			if ((testDot.lessDone==NO)||(testDot.moreDone==NO)) {
				return dIdx;
			} else {
				return -1;
			}
		}
	}
	
	return -1;
}

-(void)startNewLoop {
	currentLoop=rand() % 4 + 1;
//	NSLog(@"New Loop is: %ld",(long)currentLoop);
}

-(void)playLoop {
	NSError *error;
	switch (currentLoop) {
		case 1:
			[playerLoop1 setDelegate:self];
			[playerLoop1 play];
			if (error) {
				NSLog(@"playLoop, loop1: %@",[error localizedDescription]);
			}
			break;
		case 2:
			[playerLoop2 setDelegate:self];
			[playerLoop2 play];
			if (error) {
				NSLog(@"playLoop, loop2: %@",[error localizedDescription]);
			}
			break;
		case 3:
			[playerLoop3 setDelegate:self];
			[playerLoop3 play];
			if (error) {
				NSLog(@"playLoop, loop3: %@",[error localizedDescription]);
			}
			break;
		case 4:
			[playerLoop4 setDelegate:self];
			[playerLoop4 play];
			if (error) {
				NSLog(@"playLoop, loop4: %@",[error localizedDescription]);
			}
			break;
	}
}

- (void) playSuccessTune {
	int randTune;
	randTune=rand() % 4 + 1;
	switch (randTune) {
		case 1:
			[playerSuccess01 setDelegate:self];
			[playerSuccess01 play];
			break;
		case 2:
			[playerSuccess02 setDelegate:self];
			[playerSuccess02 play];
			break;
		case 3:
			[playerSuccess03 setDelegate:self];
			[playerSuccess03 play];
			break;
		case 4:
			[playerSuccess04 setDelegate:self];
			[playerSuccess04 play];
			break;
		default:
			NSLog(@"Unknown success tune chosen: %d",randTune);
	}
}

-(void)stopLoops {
	if ([playerLoop1 isPlaying]) {
		[playerLoop1 stop];
	}
	if ([playerLoop2 isPlaying]) {
		[playerLoop2 stop];
	}
	if ([playerLoop3 isPlaying]) {
		[playerLoop3 stop];
	}
	if ([playerLoop4 isPlaying]) {
		[playerLoop4 stop];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (currentTouch==-1) {
		if (isDrawing==NO) {
			aDot *testDot;
			for (UITouch *touch in touches) {
				CGPoint tempPoint = [touch locationInView:self.view];
				NSInteger dotHit=[self inDotN:tempPoint];
		
				if (isDrawing==NO) {
					if (lastPoint.x>-1) {
						currentTouch=[touch hash];
						isDrawing=YES;
						CGPoint currentPoint = [touch locationInView:self.view];
						[self joinDots:self.tempDrawImage.frame.size fromDot:lastPoint toDot:currentPoint lineWidth:testDot.frame.size.width/2];
//						NSLog(@"Playing new loop");
						[self startNewLoop];
						[self playLoop];
					} else {
						if (dotHit>-1) {
							currentTouch=[touch hash];
							isDrawing=YES;
							activeDot=dotHit;
							testDot=dotCollection[activeDot];
							lastPoint = CGPointMake(testDot.frame.origin.x + (testDot.frame.size.width/2),
												testDot.frame.origin.y + (testDot.frame.size.height/2));
//							NSLog(@"Playing new loop");
							[self startNewLoop];
							[self playLoop];
						}
					}
				}
			}
		}
	}
}

-(void)joinDots:(CGSize)whichFrame fromDot:(CGPoint)fromDot toDot:(CGPoint)toDot lineWidth:(float)lineWidth{
	UIGraphicsBeginImageContext(whichFrame);
	[[UIColor whiteColor] set];
	CGContextRef currentContext =UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(currentContext,lineWidth);
	CGContextMoveToPoint(currentContext,fromDot.x, fromDot.y);
	CGContextAddLineToPoint(currentContext,toDot.x, toDot.y);
	CGContextStrokePath(currentContext);
	CGContextFlush(currentContext);
	self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (isDrawing==YES) {
		for (UITouch *touch in touches) {
			if (currentTouch==[touch hash]) {
				CGPoint currentPoint = [touch locationInView:self.view];
				aDot *testDot=dotCollection[activeDot];
				float dotLessLeft=testDot.dotLess.frame.origin.x;
				float dotLessRight=testDot.dotLess.frame.origin.x+testDot.dotLess.frame.size.width;
				float dotLessTop=testDot.dotLess.frame.origin.y;
				float dotLessBottom=testDot.dotLess.frame.origin.y+testDot.dotLess.frame.size.height;
				float dotMoreLeft=testDot.dotMore.frame.origin.x;
				float dotMoreRight=testDot.dotMore.frame.origin.x+testDot.dotMore.frame.size.width;
				float dotMoreTop=testDot.dotMore.frame.origin.y;
				float dotMoreBottom=testDot.dotMore.frame.origin.y+testDot.dotMore.frame.size.height;
				if ((currentPoint.x>=dotLessLeft)&&
					(currentPoint.x<=dotLessRight)&&
					(currentPoint.y>=dotLessTop)&&
					(currentPoint.y<=dotLessBottom)) {
					currentPoint.x=testDot.dotLess.frame.origin.x + (testDot.dotLess.frame.size.width/2);
					currentPoint.y=testDot.dotLess.frame.origin.y+(testDot.dotLess.frame.size.height/2);
					if (testDot.lessDone==NO) {
						isDrawing=NO;
						testDot.lessDone=YES;
						testDot.dotLess.moreDone=YES;
					}
				} else {
					if ((currentPoint.x>=dotMoreLeft)&&
						(currentPoint.x<=dotMoreRight)&&
						(currentPoint.y>=dotMoreTop)&&
						(currentPoint.y<=dotMoreBottom)) {
							currentPoint.x=testDot.dotMore.frame.origin.x + (testDot.dotMore.frame.size.width/2);
						currentPoint.y=testDot.dotMore.frame.origin.y+(testDot.dotMore.frame.size.height/2);
						if (testDot.moreDone==NO) {
							isDrawing=NO;
							testDot.moreDone=YES;
							testDot.dotMore.lessDone=YES;
						}
					}
				}
		
				[self joinDots:self.tempDrawImage.frame.size fromDot:lastPoint toDot:currentPoint lineWidth:testDot.frame.size.width/2];
		
				if (isDrawing==NO) {
					UIGraphicsBeginImageContext(self.mainImage.frame.size);
					[self.tempDrawImage.layer renderInContext:UIGraphicsGetCurrentContext()];
					[self.mainImage.layer renderInContext:UIGraphicsGetCurrentContext()];
					self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
					self.tempDrawImage.image = nil;
					UIGraphicsEndImageContext();
					[self stopLoops];
					if ([self allDotsDone]) {
						[UIView animateWithDuration:4
									  delay:00
									options:UIViewAnimationOptionCurveEaseIn
								 animations:^(void)
						 {
							 [chosenImage setAlpha:1.0f];
							 [self.mainImage setAlpha:0.0f];
							 NSInteger dCnt=[dotCollection count];
							 aDot *hideDot;
							 for (int dIdx=0; dIdx<dCnt; dIdx++) {
								 hideDot=dotCollection[dIdx];
								 [hideDot setAlpha:0.0f];
							 }
						 }
						completion:^(BOOL finished)
						 {
							 [self.mainImage setAlpha:1.0f];
							 self.mainImage.image=nil;
						 }];
						[self playSuccessTune];
						[hintDot stopDot];
						completedPic=YES;
						currentTouch=-1;
						lastPoint.x=-1;
					} else {
						// Change the hint dot to move between the next two available dots.
						// Shouldn't get here if there isn't a dot that hasn't been done, so log all the dots if dCnt=-1
						NSInteger dCnt=[self nextDotToDo];
						if (dCnt==-1) {
							NSLog(@"Haven't done all the dots but there aren't any dots that haven't been done!");
							for (int dIdx=0; dIdx<[dotCollection count]; dIdx++) {
								aDot *dumpDot;
								dumpDot=dotCollection[dIdx];
								NSLog(@"%@",dumpDot);
							}
						}
						if (dCnt>-1) {
							aDot *newEnd1, *newEnd2;
							newEnd1=dotCollection[dCnt];
							if (dCnt<[dotCollection count]-1) {
								newEnd2=dotCollection[dCnt+1];
							} else {
								newEnd2=dotCollection[0];
							}
							[hintDot replaceDot:newEnd1.frame endRect:newEnd2.frame];
						}
						currentTouch=-1;
						lastPoint.x=-1;
					}
				}
			}
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if (isDrawing==YES) {
		for (UITouch *touch in touches) {
			if (currentTouch == [touch hash]) {
				CGPoint currentPoint = [touch locationInView:self.view];
		
				isDrawing=NO;
				aDot *testDot=dotCollection[activeDot];
				float dotLessLeft=testDot.dotLess.frame.origin.x;
				float dotLessRight=testDot.dotLess.frame.origin.x+testDot.dotLess.frame.size.width;
				float dotLessTop=testDot.dotLess.frame.origin.y;
				float dotLessBottom=testDot.dotLess.frame.origin.y+testDot.dotLess.frame.size.height;
				float dotMoreLeft=testDot.dotMore.frame.origin.x;
				float dotMoreRight=testDot.dotMore.frame.origin.x+testDot.dotMore.frame.size.width;
				float dotMoreTop=testDot.dotMore.frame.origin.y;
				float dotMoreBottom=testDot.dotMore.frame.origin.y+testDot.dotMore.frame.size.height;
				if ((currentPoint.x>=dotLessLeft)&&
					(currentPoint.x<=dotLessRight)&&
					(currentPoint.y>=dotLessTop)&&
					(currentPoint.y<=dotLessBottom)) {
					currentPoint.x=testDot.dotLess.frame.origin.x + (testDot.dotLess.frame.size.width/2);
					currentPoint.y=testDot.dotLess.frame.origin.y+(testDot.dotLess.frame.size.height/2);
					if (testDot.lessDone==NO) {
						isDrawing=YES;
						testDot.lessDone=YES;
						testDot.dotLess.moreDone=YES;
					}
				} else {
					if ((currentPoint.x>=dotMoreLeft)&&
						(currentPoint.x<=dotMoreRight)&&
						(currentPoint.y>=dotMoreTop)&&
						(currentPoint.y<=dotMoreBottom)) {
						currentPoint.x=testDot.dotMore.frame.origin.x + (testDot.dotMore.frame.size.width/2);
						currentPoint.y=testDot.dotMore.frame.origin.y+(testDot.dotMore.frame.size.height/2);
						if (testDot.moreDone==NO) {
							isDrawing=YES;
							testDot.moreDone=YES;
							testDot.dotMore.lessDone=YES;
						}
					}
				}
		
				if (isDrawing==YES) {
					// Draw line between two joined dots on the temporary image, then merge the
					// line in to the main drawing image so that it remains on the screen. Clear
					// the temporary image.
			
					[self joinDots:self.tempDrawImage.frame.size fromDot:lastPoint toDot:currentPoint lineWidth:testDot.frame.size.width/2];
			
					UIGraphicsBeginImageContext(self.mainImage.frame.size);
					[self.tempDrawImage.layer renderInContext:UIGraphicsGetCurrentContext()];
					[self.mainImage.layer renderInContext:UIGraphicsGetCurrentContext()];
					self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
					self.tempDrawImage.image = nil;
					UIGraphicsEndImageContext();
					lastPoint.x=-1;
					if ([self allDotsDone]) {
						[UIView animateWithDuration:4
											  delay:00
											options:UIViewAnimationOptionCurveEaseIn
										 animations:^(void)
						 {
							 [chosenImage setAlpha:1.0f];
							 [self.mainImage setAlpha:0.0f];
							 NSInteger dCnt=[dotCollection count];
							 aDot *hideDot;
							 for (int dIdx=0; dIdx<dCnt; dIdx++) {
								 hideDot=dotCollection[dIdx];
								 [hideDot setAlpha:0.0f];
							 }
						 }
										 completion:^(BOOL finished)
						 {
							 [self.mainImage setAlpha:1.0f];
							 self.mainImage.image=nil;
						 }];
						[self playSuccessTune];
						[hintDot stopDot];
						completedPic=YES;
						currentTouch=-1;
						lastPoint.x=-1;
					} else {
						// Change the hint dot to move between the next two available dots.
						// Shouldn't get here if there isn't a dot that hasn't been done, so log all the dots if dCnt=-1
						NSInteger dCnt=[self nextDotToDo];
						if (dCnt==-1) {
							NSLog(@"Haven't done all the dots but there aren't any dots that haven't been done!");
							for (int dIdx=0; dIdx<[dotCollection count]; dIdx++) {
								aDot *dumpDot;
								dumpDot=dotCollection[dIdx];
								NSLog(@"%@",dumpDot);
							}
						}
						if (dCnt>-1) {
							aDot *newEnd1, *newEnd2;
							newEnd1=dotCollection[dCnt];
							if (dCnt<[dotCollection count]-1) {
								newEnd2=dotCollection[dCnt+1];
							} else {
								newEnd2=dotCollection[0];
							}
							[hintDot replaceDot:newEnd1.frame endRect:newEnd2.frame];
						}
						currentTouch=-1;
						lastPoint.x=-1;
					}
				} else {
					// Draw a null line on the temporary drawing to remove the current line.
					//[self joinDots:self.tempDrawImage.frame.size fromDot:lastPoint toDot:lastPoint lineWidth:0];
				}
		
				isDrawing=NO;
				[self stopLoops];
				currentTouch=-1;
			}
		}
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
	// Audio will finish playing because: (a) two dots have been connected; (b) user has taken theire finger off the
	// screen; or (c) the success tune has finished.
	// For
	if (isDrawing==YES) {
		[self playLoop];
	} else {
		if (completedPic==YES) {
			// Set a timer to start game again after a pause period.
			[NSTimer scheduledTimerWithTimeInterval:4
											 target:self
										   selector:@selector(waitForIt:)
										   userInfo:nil
											repeats:NO];
		}
	}
}

- (void)waitForIt:(NSTimer*)theTimer {
	[self chooseNewPicture];
}
@end
