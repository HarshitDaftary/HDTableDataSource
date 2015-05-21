//
//
//  Created by Harshit Daftary on 21 May 2015

#import "HDBlueCell.h"
#import "ClsBlue.h"

@implementation HDBlueCell

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

-(void)configureCell:(ClsBlue*)pobjBlue
{
    _lblTitle.text = pobjBlue.strTitle;
}

@end
