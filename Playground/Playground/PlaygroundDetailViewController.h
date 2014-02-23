//
//  PlaygroundDetailViewController.h
//  Playground
//
//  Created by Lulu Tang on 2/23/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaygroundDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
