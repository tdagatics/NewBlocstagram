//
//  BLCAppDelegate.m
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "BLCAppDelegate.h"
#import "BLCImagesTableViewController.h"
#import "BLCLoginViewController.h"
#import "BLCDataSource.h"


@implementation BLCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
    // Create the data source so it can receive the access token notification
    [BLCDataSource sharedInstance];
    
    UINavigationController *navVC = [[UINavigationController alloc] init]; // Initialize a navigation view controller
    BLCLoginViewController *loginVC = [[BLCLoginViewController alloc] init]; // Initialize a login view controller
    // At launch, show the login controller
    [navVC setViewControllers:@[loginVC] animated:YES];
    [navVC setTitle:@"Login"];
    
    
    // Detect when the notification posts
    [[NSNotificationCenter defaultCenter] addObserverForName:BLCLoginViewControllerDidGetAccessTokenNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        // When the notification posts, switch the root view controller from the login controller to the table controller
        BLCImagesTableViewController *imagesVC = [[BLCImagesTableViewController alloc] init];
        [navVC setViewControllers:@[imagesVC] animated:YES];
        [navVC setTitle:@"Login"];
        

    }];
    
    self.window.rootViewController = navVC;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
