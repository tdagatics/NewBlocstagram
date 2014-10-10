//
//  BLCLoginViewController.m
//  NewBlocstagram
//
//  Created by Anthony Dagati on 10/10/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "BLCLoginViewController.h"
#import "BLCDataSource.h"

@interface BLCLoginViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation BLCLoginViewController

NSString *const BLCLoginViewControllerDidGetAccessTokenNotification = @"BLCLoginViewControllerDidGetAccessTokenNotification";

-(NSString *)redirectURI {
    return @"http://bloc.io";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *urlString = [NSString stringWithFormat:@"https://instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token", [BLCDataSource instagramClientID], [self redirectURI]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    if (url) {
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    
    
}

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    
    self.webView = webView;
    self.view = webView;
    
    
    self.title = @"Login";
    self.homeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.homeButton setTitle:@"Home" forState:UIControlStateNormal];
    //self.homeButton.frame = CGRectMake(20, 75, 50, 25);
    [self.homeButton addTarget:self action:@selector(homePressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.homeButton];
}

-(void)homePressed:(UIButton *) sender {
    BLCLoginViewController *loginVC = [[BLCLoginViewController alloc] init];
    NSLog(@"Home button pressed.");
    self.title = @"Back";
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
 // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */



#pragma mark - dealloc method

- (void) dealloc {
    [self clearInstagramCookies];
    self.webView.delegate = nil;
}

/** Clear Instagram cookies. This prevents caching the credentials in the cookie jar. */

-(void) clearInstagramCookies {
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]) {
        NSRange domainRange = [cookie.domain rangeOfString:@"instagram.com"];
        if(domainRange.location != NSNotFound) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = request.URL.absoluteString;
    if ([urlString hasPrefix:[self redirectURI]]) {
        // This contains our auth token
        NSRange rangeOfAccessTokenParameter = [urlString rangeOfString:@"access_token="];
        NSUInteger indexOfTokenStarting = rangeOfAccessTokenParameter.location + rangeOfAccessTokenParameter.length;
        NSString *accessToken = [urlString substringFromIndex:indexOfTokenStarting];
        [[NSNotificationCenter defaultCenter] postNotificationName:BLCLoginViewControllerDidGetAccessTokenNotification object: accessToken];
        return NO;
    }
    return YES;
}

@end
