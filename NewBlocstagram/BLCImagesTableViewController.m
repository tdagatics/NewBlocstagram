//
//  BLCImagesTableViewController.m
//  NewBlocstagram
//
//  Created by Anthony Dagati on 9/29/14.
//  Copyright (c) 2014 Black Rail Capital. All rights reserved.
//

#import "BLCImagesTableViewController.h"
#import "BLCUser.h"
#import "BLCMedia.h"
#import "BLCComment.h"
#import "BLCDataSource.h"


@implementation BLCImagesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
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
 
BLCMedia *item = [self items][indexPath.row];
imageView.image = item.image;

 
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
    return [self items].count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLCMedia *item = [self items][indexPath.row];
    UIImage *image = item.image;return (CGRectGetWidth(self.view.frame) / image.size.width) * image.size.height;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
    // Delete the row from the data source
        NSMutableArray *array = [self items];
        [array removeObjectAtIndex:indexPath.row];
    //reload Table view
    [tableView reloadData];
    }

}

-(NSMutableArray *)items {
    NSMutableArray *items = [BLCDataSource sharedInstance].mediaItems;
    return items;
}

@end
