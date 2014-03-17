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
#import <QuartzCore/QuartzCore.h>

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
    
    PFUser *user = [PFUser currentUser];
    self.title = [NSString stringWithFormat:@"%@'s Recipes", user[@"username"]];
}

- (void)viewDidAppear:(BOOL)animated {
    // Asynchronously grab the data from Parse
    PFQuery *query = [PFQuery queryWithClassName:@"recipe"];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithTarget:self selector:@selector(findCallback:error:)];
}

- (void)findCallback:(NSArray *)objects error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"Successfully retrieved %d recipes.", (int)objects.count);
        [self.recipes removeAllObjects];
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
    
    cell.nameLabel.text = recipe[@"name"];
    if (recipe[@"thumbnail"] == nil) {
        cell.thumbnailImageView.image = [UIImage imageNamed:@"default.png"];
    } else {
        cell.thumbnailImageView.image = [UIImage imageNamed:recipe[@"thumbnail"]];
    }
    cell.prepTimeLabel.text = recipe[@"prepTime"];
    
    // Make picture into a circle
    CGRect thumbnailframe = CGRectMake(5, 5, 69, 69);
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(thumbnailframe, NULL);
    maskLayer.bounds = thumbnailframe;
    [maskLayer setPath:maskPath];
    maskLayer.position = CGPointMake(thumbnailframe.size.width/2, thumbnailframe.size.height/2);
    [cell.thumbnailImageView.layer setMask:maskLayer];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

@end
