//
//  PlaygroundViewController.m
//  Playground
//
//  Created by Lulu Tang on 2/23/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlaygroundTableViewController.h"
#import "TableCell.h"
#import <Parse/Parse.h>

@interface PlaygroundTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *recipes;
@end

@implementation PlaygroundTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    if (!_recipes) _recipes = [[NSMutableArray alloc] init];
    
    // load up recipes array with cached data
    // ...
    
    // Asynchronously grab the data from Parse
    PFQuery *query = [PFQuery queryWithClassName:@"recipe"];
    [query findObjectsInBackgroundWithTarget:self selector:@selector(findCallback:error:)];
}

- (void)findCallback:(NSArray *)objects error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"Successfully retrieved %d recipes.", objects.count);
        for (PFObject *object in objects) {
            [self.recipes addObject:object];
        }
        [self.tableView reloadData];
    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TableCell";
    
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    PFObject *recipe = [self.recipes objectAtIndex:indexPath.row];
    PFUser *user = [PFUser currentUser];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@'s %@", user[@"username"], recipe[@"name"]];
    cell.thumbnailImageView.image = [UIImage imageNamed:recipe[@"thumbnail"]];
    cell.prepTimeLabel.text = recipe[@"prepTime"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

@end
