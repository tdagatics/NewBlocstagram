//
//  BLCDataSource.h
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLCMedia;

typedef void (^BLCNewItemCompletionBlock)(NSError *error);

@interface BLCDataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSMutableArray *mediaItems;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, assign) BOOL isLoadingOlderItems;
@property (nonatomic, strong, readonly) NSString *accessToken;
@property (nonatomic, assign) BOOL thereAreNoMoreOlderMessages;

-(NSString *) pathForFileName:(NSString *) fileName;


- (void) deleteMediaItem:(BLCMedia *)item;

-(void)requestNewItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
-(void)requestOldItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
-(void)downloadImageForMediaItem:(BLCMedia *)mediaItem;

+ (NSString *) instagramClientID;



@end
