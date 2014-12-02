//
//  dotSet.m
//  See Me Draw
//
//  Created by Ian on 27/02/2014.
//  Copyright (c) 2014 Ian. All rights reserved.
//

#import "dotSet.h"

@implementation dotSet

@synthesize collection;
@synthesize imageName;

- (id) init:(NSInteger)imageNo {
	self=[super init];
	
	switch (imageNo) {
		case 1:
			self.collection=[self dotsFor01];
			break;
		case 2:
			self.collection=[self dotsFor02];
			break;
		case 3:
			self.collection=[self dotsFor03];
			break;
		case 4:
			self.collection=[self dotsFor04];
			break;
		case 5:
			self.collection=[self dotsFor05];
			break;
		case 6:
			self.collection=[self dotsFor06];
			break;
		case 7:
			self.collection=[self dotsFor07];
			break;
		case 8:
			self.collection=[self dotsFor08];
			break;
		case 9:
			self.collection=[self dotsFor09];
			break;
		case 10:
			self.collection=[self dotsFor10];
			break;
		default:
			NSLog(@"Unknown picture selected to display: %ld",(long)imageNo);
			break;
	}
	
	self.imageName = [NSString stringWithFormat:@"image%02ld",(long)imageNo];
	
	return self;
}

- (NSMutableArray *) dotsFor01 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(24,340,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(67,304,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(292,289,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(394,205,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(753,205,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(814,304,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(895,310,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(958,339,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(958,463,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(879,466,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(838,531,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(766,537,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(720,475,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(261,474,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(216,541,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(153,538,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(106,462,30,30) ]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(31,435,30,30) ]];
	return tempDots;
}

- (NSMutableArray *) dotsFor02 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(276,607,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(243,222,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(670,211,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(784,372,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(724,580,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor03 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(52,454,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(532,369,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(565,271,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(675,253,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(834,168,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(946,306,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(876,484,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(727,463,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(622,492,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(550,430,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(72,534,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor04 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(99,340,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(196,312,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(438,309,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(664,249,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(712,235,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(745,195,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(780,223,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(742,276,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(736,342,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(829,382,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(874,462,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(916,499,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(885,526,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(846,504,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(573,502,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(258,562,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(162,549,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(153,504,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(204,447,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(102,385,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor05 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(427,572,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(405,203,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(587,189,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(589,371,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(728,430,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(705,600,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(552,697,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor06 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(98,107,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(896,107,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(896,582,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(541,596,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(712,659,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(265,659,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(430,596,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(98,582,30,30)]];
	
	return tempDots;
}

- (NSMutableArray *) dotsFor07 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(87,406,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(289,340,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(301,418,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(525,283,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(916,171,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(109,553,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor08 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(276,284,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(705,272,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(688,637,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(493,684,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(282,627,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor09 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(213,111,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(430,42,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(594,87,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(759,305,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(746,463,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(706,459,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(698,342,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(666,289,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(619,315,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(642,536,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(675,576,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(586,660,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(374,664,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(287,597,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(313,532,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(297,297,30,30)]];
	return tempDots;
}

- (NSMutableArray *) dotsFor10 {
	NSMutableArray *tempDots = [NSMutableArray arrayWithObjects:nil count:0];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(233,206,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(450,199,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(452,263,30,30)]];
//	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(481,264,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(539,312,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(757,349,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(751,461,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(524,513,30,30)]];
	[tempDots addObject:[NSValue valueWithCGRect:CGRectMake(235,420,30,30)]];
	return tempDots;
}

@end
