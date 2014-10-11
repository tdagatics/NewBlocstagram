//
//  BLCUser.m
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "BLCUser.h"

@implementation BLCUser

-(instancetype) initWithDictionary:(NSDictionary *)userDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = userDictionary[@"id"];
        self.userName = userDictionary[@"username"];
        self.fullName = userDictionary[@"full_name"];
        
        NSString *profileURLString = userDictionary[@"profile picture"];
        NSURL *profileURL = [NSURL URLWithString:profileURLString];
        
        if (profileURL) {
            self.profilePictureURL = profileURL;
            
        }
    }
    
    return self;
}

@end
