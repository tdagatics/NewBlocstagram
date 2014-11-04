//
//  BLCMediaTableViewCell.h
//  NewBlocstagram
//
//  Created by Anthony Dagati on 10/1/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLCMediaFullScreenViewController.h"

@class BLCMedia, BLCMediaTableViewCell;

@protocol BLCMediaTableViewCellDelegate <NSObject>

-(void)cell:(BLCMediaTableViewCell *)cell didTapImageView:(UIImageView *)imageView;
-(void)cell:(BLCMediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;
-(void)cellDidPressLikeButton:(BLCMediaTableViewCell *)cell;

@end


@interface BLCMediaTableViewCell : UITableViewCell <UIGestureRecognizerDelegate>

@property (nonatomic, strong) BLCMedia *mediaItem;
@property (nonatomic, weak) id <BLCMediaTableViewCellDelegate> delegate;
@property (nonatomic, strong) UIImageView *mediaImageView;
@property (nonatomic, strong) UILabel *usernameAndCaptionLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) NSLayoutConstraint *imageHeightConstraint; 
@property (nonatomic, strong) NSLayoutConstraint *usernameAndCaptionLabelHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *commentLabelHeightConstraint;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (nonatomic, strong) BLCLikeButton *likeButton;

+(CGFloat) heightForMediaItem:(BLCMedia *)mediaItem width:(CGFloat)width;

-(void) longPressFired:(UILongPressGestureRecognizer *)sender;

@end
