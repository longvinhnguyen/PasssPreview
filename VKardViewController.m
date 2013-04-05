//
//  VKardViewController.m
//  PasssPreview
//
//  Created by VisiKard MacBook Pro on 4/3/13.
//  Copyright (c) 2013 VisiKard MacBook Pro. All rights reserved.
//

#import "VKardViewController.h"
#import <PassKit/PassKit.h>

@interface VKardViewController ()

@end

@implementation VKardViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        passes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![PKPassLibrary isPassLibraryAvailable]) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"PassKit not available" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil] show];
    }
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"%@", resourcePath);
    
    NSArray *passFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:resourcePath error:nil];
    NSLog(@"%d",[passFiles count]);
    
    for (NSString *passFile in passFiles) {
        if ([passFile hasSuffix:@".pkpass"]) {
            [passes addObject:passFile];
        }
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [passes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [cell.textLabel setText:[passes objectAtIndex:indexPath.row]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *passName = [passes objectAtIndex:indexPath.row];
    [self openPassWithName:passName];
}

- (void)openPassWithName:(NSString *)pathName
{
    NSString *passFie = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:pathName];
    NSData *data = [NSData dataWithContentsOfFile:passFie];
    
    NSError *error = nil;
    PKPass *pass = [[PKPass alloc] initWithData:data error:&error];
    
    if (error != nil) {
        [[[UIAlertView alloc] initWithTitle:@"Passes Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
    PKAddPassesViewController *addController = [[PKAddPassesViewController alloc] initWithPass:pass];
    [addController setDelegate:self];
    [self presentViewController:addController animated:YES completion:nil];
    
    
    
}

- (void)addPassesViewControllerDidFinish:(PKAddPassesViewController *)controller
{
    NSLog(@"Finish add passbook");
    [self dismissViewControllerAnimated:YES completion:nil];
}














@end
