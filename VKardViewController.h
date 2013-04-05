//
//  VKardViewController.h
//  PasssPreview
//
//  Created by VisiKard MacBook Pro on 4/3/13.
//  Copyright (c) 2013 VisiKard MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PassKit/PassKit.h>

@interface VKardViewController : UITableViewController<PKAddPassesViewControllerDelegate>
{
    NSMutableArray *passes;
}

- (void)openPassWithName: (NSString *)pathName;

@end
