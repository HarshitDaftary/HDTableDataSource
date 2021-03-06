//
//
//  Created by Harshit Daftary on 21 May 2015


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item,NSIndexPath *indexPath);
typedef NSString*(^CellIdentifierBlock)(id item, NSIndexPath *indexPath);
typedef NSArray*(^SectionItemArray)(id section);

@interface HDTableDataSource : NSObject<UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)initWithItems:(NSArray *)anItems multipleCellBlock:(CellIdentifierBlock)pMultipleCellIdBlock configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) NSArray *arrItems;
@property (nonatomic, strong) NSArray *arrSections;
@property (nonatomic, copy) NSString *strCellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) SectionItemArray sectionItemBlock;
@property (copy, nonatomic) CellIdentifierBlock cellIdentifierForCellBlock;


@end
