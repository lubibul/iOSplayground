//
//  PlaygroundViewController.m
//  Playground
//
//  Created by Lulu Tang on 2/23/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import "PlaygroundViewController.h"
#import "TableCell.h"
#import <Parse/Parse.h>

@interface PlaygroundViewController ()

@end

@implementation PlaygroundViewController
{
    NSArray *recipes;
    NSArray *thumbnails;
    NSArray *prepTime;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    // Initialize thumbnails
    thumbnails = [NSArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg", @"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg", @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg", @"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];
    
    // Initialize prep times
    prepTime = [NSArray arrayWithObjects:@"30 min", @"30 min", @"1 hour", @"10 min", @"10 min", @"1 hour", @"1 hour", @"5 min", @"30 min", @"10 min", @"1 hour", @"30 min", @"15 min", @"2 hours", @"3 hours", @"30 min", nil];
    
    for (int i=0; i<[recipes count]; i++) {
        PFObject *recipe = [PFObject objectWithClassName:@"recipe"];
        recipe[@"name"] = [recipes objectAtIndex:i];
        recipe[@"thumbnail"] = [thumbnails objectAtIndex:i];
        recipe[@"prepTime"] = [prepTime objectAtIndex:i];
        [recipe saveInBackground];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [recipes objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

@end
