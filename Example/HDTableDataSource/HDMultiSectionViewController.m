//
//
//  Created by Harshit Daftary on 21 May 2015

#import "HDMultiSectionViewController.h"
#import "ClsBlue.h"
#import "ClsRed.h"
#import "ClsColorCategory.h"
#import "HDTableDataSource.h"
#import "HDBlueCell.h"
#import "HDRedCell.h"
#import "CustomSectionView.h"

@interface HDMultiSectionViewController ()

@end

@implementation HDMultiSectionViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeOnce];
    // Do any additional setup after loading the view.
}

#pragma mark - Initializitations

-(void)initializeOnce
{
    _arrCategories = [[NSMutableArray alloc] init];
    [self addStaticData];
    [self configureTable];
    [_tblItems reloadData];
}

-(void)configureTable
{
    _objTableDataSource = [[HDTableDataSource alloc] initWithItems:nil multipleCellBlock:^NSString *(id item, NSIndexPath *indexPath) {
        
        if ([item isKindOfClass:[ClsRed class]])
            return @"RedCellIdentifier";
        else
            return @"BlueCellIdentifier";
        
        return @"";
        
    } configureCellBlock:^(id cell, id item, NSIndexPath *indexPath) {
        
        id blocksItem = nil;
        
        if ([item isKindOfClass:[ClsRed class]])
        {
            HDRedCell *objRedCell = (HDRedCell*)cell;
            [objRedCell configureCell:item];
        }
        else
        {
            HDBlueCell *objBlueCell = (HDBlueCell*)cell;
            [objBlueCell configureCell:item];
            blocksItem = objBlueCell;
        }
    }];
    
    _objTableDataSource.sectionItemBlock = ^ NSArray* (id objSection){
        
        ClsColorCategory *objCategory = (ClsColorCategory*)objSection;
        return objCategory.arrItems;
    };
    
    _objTableDataSource.arrSections = _arrCategories;
    _tblItems.dataSource= _objTableDataSource;
}

#pragma mark - Tableview Delegates

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomSectionView *objSectionView = (CustomSectionView*)[[[NSBundle mainBundle] loadNibNamed:@"CustomSectionView" owner:self options:nil] objectAtIndex:0];
    ClsColorCategory *objCategory = [_arrCategories objectAtIndex:section];
    objSectionView.lblTitle.text = objCategory.strCategoryname;
    return objSectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 34;
}

#pragma mark - Other Methods

-(void)addStaticData
{
    // Adding Blue Category
    ClsColorCategory *objCategory  = [[ClsColorCategory alloc] init];
    objCategory.strCategoryname = @"Blue Color";
    objCategory.arrItems = [[NSMutableArray alloc] init];
    
    ClsBlue *objBlue = [[ClsBlue alloc] init];
    objBlue.strTitle = @"Title1";
    [objCategory.arrItems addObject:objBlue];
    
    objBlue = [[ClsBlue alloc] init];
    objBlue.strTitle = @"Title3";
    [objCategory.arrItems addObject:objBlue];
    
    objBlue = [[ClsBlue alloc] init];
    objBlue.strTitle = @"Title2";
    [objCategory.arrItems addObject:objBlue];
    
    [_arrCategories addObject:objCategory];

    // Adding Red Category
    objCategory  = [[ClsColorCategory alloc] init];
    objCategory.strCategoryname = @"Red Color";
    objCategory.arrItems = [[NSMutableArray alloc] init];
    
    ClsRed *objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit";
    objRed.intPoint = 100;
    [objCategory.arrItems addObject:objRed];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit1";
    objRed.intPoint = 10;
    [objCategory.arrItems addObject:objRed];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit2222";
    objRed.intPoint = 20;
    [objCategory.arrItems addObject:objRed];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit34";
    objRed.intPoint = 430;
    [objCategory.arrItems addObject:objRed];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit344";
    objRed.intPoint = 40;
    [objCategory.arrItems addObject:objRed];
    
    [_arrCategories addObject:objCategory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBackTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
