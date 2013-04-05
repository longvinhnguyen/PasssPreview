//
//  VKardViewController.m
//  PasssPreview
//
//  Created by VisiKard MacBook Pro on 4/3/13.
//  Copyright (c) 2013 VisiKard MacBook Pro. All rights reserved.
//

#import "VKardViewController.h"

@interface VKardViewController ()

@end

@implementation VKardViewController

- (void)loadView
{
    [super loadView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell.textLabel setText:@"AAA"];
    return cell;
}




@end
