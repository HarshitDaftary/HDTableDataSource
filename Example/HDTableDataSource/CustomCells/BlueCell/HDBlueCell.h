//
//
//  Created by Harshit Daftary on 21 May 2015

#import <UIKit/UIKit.h>

@class ClsBlue;
@interface HDBlueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

-(void)configureCell:(ClsBlue*)pobjBlue;

@end
