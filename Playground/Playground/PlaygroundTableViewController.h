//
//  PlaygroundViewController.h
//  Playground
//
//  Created by Lulu Tang on 2/23/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaygroundTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
- (void)findCallback:(NSArray *)objects error:(NSError *)error;
@end
