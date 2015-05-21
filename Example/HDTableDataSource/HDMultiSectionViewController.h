//
//
//  Created by Harshit Daftary on 21 May 2015

#import <UIKit/UIKit.h>

@class HDTableDataSource;
@interface HDMultiSectionViewController : UIViewController <UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *arrCategories;
@property (strong, nonatomic) HDTableDataSource *objTableDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tblItems;

- (IBAction)btnBackTapped:(id)sender;
@end
