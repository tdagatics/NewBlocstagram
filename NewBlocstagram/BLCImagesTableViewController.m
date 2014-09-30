//
//  BLCImagesTableViewController.m
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "BLCImagesTableViewController.h"

@implementation BLCImagesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.images = [NSMutableArray array];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i = 1; i <= 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [self.images addObject:image];
        }
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"imageCell"];
    
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
 
 // Configure the cell...
 static NSInteger imageViewTag = 1234;
 UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:imageViewTag];
 
 if (!imageView) {
 // This is a new cell, it doesn't have an image view yet
 imageView = [[UIImageView alloc] init];
 imageView.contentMode = UIViewContentModeScaleToFill;
 
 imageView.frame = cell.contentView.bounds;
 imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
 
 imageView.tag = imageViewTag;
 [cell.contentView addSubview:imageView];
 }
 
 UIImage *image = self.images[indexPath.row];
 imageView.image = image;
 
 return cell;
 }
 

/*
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}
 */


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.images.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = self.images[indexPath.row];
    return (CGRectGetWidth(self.view.frame) / image.size.width) * image.size.height;
}

@end
