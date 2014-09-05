//
//  TableDataSource.h
//  RateUpon
//
//  Created by Administrator on 19/08/14.
//  Copyright (c) 2014 inheritx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item, NSIndexPath *indexPath);
typedef NSString*(^MultipleCellIdentifierBlock)(id item, NSIndexPath *indexPath);

@interface HDTableDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *arrItems;
@property (strong, nonatomic) NSString *strCellIdentifier;
@property (copy, nonatomic) TableViewCellConfigureBlock configureCellBlock;
@property (copy, nonatomic) MultipleCellIdentifierBlock cellIdentifierForCellBlock;

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;
- (id)initWithItems:(NSArray *)anItems multipleCellBlock:(MultipleCellIdentifierBlock)pMultipleCellIdBlock configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
