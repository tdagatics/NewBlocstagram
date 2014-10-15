//
//  BLCMediaFullScreenViewController.h
//  NewBlocstagram
//
//  Created by Anthony Dagati on 10/15/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCMedia;

@interface BLCMediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

-(instancetype) initWithMedia:(BLCMedia *)media;

-(void) centerScrollView;

@end
