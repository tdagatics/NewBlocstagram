//
//  BLCDataSource.h
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLCDataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSMutableArray *mediaItems;

@end
