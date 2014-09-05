//
//  HDViewController.h
//  HDTableDataSource
//
//  Created by HarshitDaftary on 09/05/2014.
//  Copyright (c) 2014 HarshitDaftary. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HDTableDataSource;
@interface HDViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *arrItems;
@property (strong, nonatomic) HDTableDataSource *objTableDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tblItems;

@end
