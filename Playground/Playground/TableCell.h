//
//  TableCell.h
//  Playground
//
//  Created by Lulu Tang on 2/23/14.
//  Copyright (c) 2014 Lulu Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@end
