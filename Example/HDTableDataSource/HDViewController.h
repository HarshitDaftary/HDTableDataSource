//
//
//  Created by Harshit Daftary on 21 May 2015

#import <UIKit/UIKit.h>

@class HDTableDataSource;
@interface HDViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *arrItems;
@property (strong, nonatomic) HDTableDataSource *objTableDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tblItems;

- (IBAction)btnShowMultipleSectionTapped:(id)sender;

@end