//
//  BLCMediaFullScreenAnimator.h
//  NewBlocstagram
//
//  Created by Anthony Dagati on 10/15/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLCMediaFullScreenAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL presenting;
@property (nonatomic, weak) UIImageView *cellImageView;

@end
