//
//  HDRedCell.h
//  HDTableDataSource
//
//  Created by Administrator on 05/09/14.
//  Copyright (c) 2014 HarshitDaftary. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClsRed;
@interface HDRedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPoints;

-(void)configureCell:(ClsRed*)pobjRed;

@end
