//
//  TableDataSource.m
//  RateUpon
//
//  Created by Administrator on 19/08/14.
//  Copyright (c) 2014 inheritx. All rights reserved.
//

#import "HDTableDataSource.h"

@implementation HDTableDataSource

- (id)init
{
    return nil;
}

- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self)
    {
        self.arrItems = anItems;
        self.strCellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)initWithItems:(NSArray *)anItems multipleCellBlock:(MultipleCellIdentifierBlock)pMultipleCellIdBlock configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self)
    {
        self.arrItems = anItems;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.cellIdentifierForCellBlock = [pMultipleCellIdBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath*)indexPath
{
    return _arrItems[(NSUInteger)indexPath.row];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrItems.count;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    
    if (_cellIdentifierForCellBlock)
        _strCellIdentifier = _cellIdentifierForCellBlock(item,indexPath);
    
    id cell = [tableView dequeueReusableCellWithIdentifier:_strCellIdentifier forIndexPath:indexPath];
    _configureCellBlock(cell,item,indexPath);
    return cell;
}

@end



