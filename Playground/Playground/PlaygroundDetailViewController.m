//
//  PlaygroundDetailViewController.m
//  Playground
//
//  Created by Lulu Tang on 4/27/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlaygroundDetailViewController.h"

@interface PlaygroundDetailViewController ()
- (void)configureView;
@end

@implementation PlaygroundDetailViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
