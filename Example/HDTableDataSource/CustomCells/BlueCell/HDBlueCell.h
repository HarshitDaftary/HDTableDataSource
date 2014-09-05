//
//  HDBlueCell.h
//  HDTableDataSource
//
//  Created by Administrator on 05/09/14.
//  Copyright (c) 2014 HarshitDaftary. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClsBlue;
@interface HDBlueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

-(void)configureCell:(ClsBlue*)pobjBlue;

@end
