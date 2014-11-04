//
//  BLCMedia.h
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLCLikeButton.h"

typedef NS_ENUM(NSInteger, BLCMediaDownloadState) {
    BLCMediaDownloadStateNeedsImage = 0,
    BLCMediaDownloadStateInProgress = 1,
    BLCMediaDownloadStateNonRecoverableError = 2,
    BLCMediaDownloadStateHasImage = 3
};

@class BLCUser;

@interface BLCMedia : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) BLCUser *user;
@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, assign) BLCMediaDownloadState downloadState;
@property (nonatomic, assign) BLCLikeState likeState;

-(instancetype) initWithDictionary:(NSDictionary *)mediaDictionary;



@end
