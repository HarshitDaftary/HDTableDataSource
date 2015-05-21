//
//
//  Created by Harshit Daftary on 21 May 2015

#import <UIKit/UIKit.h>

@class ClsRed;
@interface HDRedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPoints;

-(void)configureCell:(ClsRed*)pobjRed;

@end
