//
//
//  Created by Harshit Daftary on 21 May 2015


#import "HDTableDataSource.h"

@implementation HDTableDataSource

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        _arrItems = anItems;
        _strCellIdentifier = aCellIdentifier;
        _configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)initWithItems:(NSArray *)anItems multipleCellBlock:(CellIdentifierBlock)pMultipleCellIdBlock configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self)
    {
        _arrItems = anItems;
        _configureCellBlock = [aConfigureCellBlock copy];
        _cellIdentifierForCellBlock = [pMultipleCellIdBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_arrSections != nil)
    {
        NSArray *arrItems = [self getItemsArray:indexPath.section];
        return [arrItems objectAtIndex:indexPath.row];
    }
    
    return [_arrItems objectAtIndex:indexPath.row];
}

-(NSArray*)getItemsArray:(NSInteger)pintSection
{
    if (_arrSections == nil)
        return _arrItems;
    
    id objTmpSection = [_arrSections objectAtIndex:pintSection];
    
    if (_sectionItemBlock)
        return _sectionItemBlock(objTmpSection);
    
    return nil;
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_arrSections == nil)
        return 1;
    
    return _arrSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arrItems = [self getItemsArray:section];
    return arrItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_strCellIdentifier forIndexPath:indexPath];
    
    if (_cellIdentifierForCellBlock)
        _strCellIdentifier = _cellIdentifierForCellBlock(item,indexPath);

    _configureCellBlock(cell, item, indexPath);
    return cell;
}

@end