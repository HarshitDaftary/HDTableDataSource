//
//
//  Created by Harshit Daftary on 21 May 2015

#import "HDRedCell.h"
#import "ClsRed.h"

@implementation HDRedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCell:(ClsRed*)pobjRed
{
    _lblName.text = pobjRed.strName;
    _lblPoints.text = [NSString stringWithFormat:@"%ld",(long)pobjRed.intPoint];
}

@end
