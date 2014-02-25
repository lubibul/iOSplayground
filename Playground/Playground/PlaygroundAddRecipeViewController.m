//
//  PlaygroundAddRecipeViewController.m
//  Playground
//
//  Created by Lulu Tang on 2/25/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlaygroundAddRecipeViewController.h"
#import "PlaygroundTableViewController.h"
#import <Parse/Parse.h>

@interface PlaygroundAddRecipeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *makeRecipeButton;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *prepTimeTextField;
@end

@implementation PlaygroundAddRecipeViewController

- (IBAction)pressMakeRecipeButton:(UIButton *)sender {
    if ([self.titleTextField.text length] > 0
        && [self.prepTimeTextField.text length] > 0) {
        NSLog(@"Title: %@, prepTime: %@",
              self.titleTextField.text,
              self.prepTimeTextField.text);
        PFObject *recipe = [PFObject objectWithClassName:@"recipe"];
        recipe[@"name"] = self.titleTextField.text;
        recipe[@"prepTime"] = self.prepTimeTextField.text;
        recipe[@"author"] = [PFUser currentUser];
        [recipe saveInBackground];

        self.titleTextField.text = @"";
        self.prepTimeTextField.text = @"";
    }
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"backToRecipes"]) {
//        PFQuery *query = [PFQuery queryWithClassName:@"recipe"];
//        [query whereKey:@"author" equalTo:[PFUser currentUser]];
//        [query findObjectsInBackgroundWithTarget:self selector:@selector(findCallback:error:)];
//    }
//}

@end
