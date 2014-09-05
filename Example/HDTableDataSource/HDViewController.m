//
//  HDViewController.m
//  HDTableDataSource
//
//  Created by HarshitDaftary on 09/05/2014.
//  Copyright (c) 2014 HarshitDaftary. All rights reserved.
//

#import "HDViewController.h"
#import "HDTableDataSource.h"
#import "HDRedCell.h"
#import "HDBlueCell.h"
#import "ClsRed.h"
#import "ClsBlue.h"

@interface HDViewController ()

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeOnce];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initializeOnce
{
    _arrItems = [[NSMutableArray alloc] init];
    [self addStaticData];
    [self configureTable];
}

-(void)configureTable
{
    _objTableDataSource = [[HDTableDataSource alloc] initWithItems:_arrItems multipleCellBlock:^NSString *(id item, NSIndexPath *indexPath) {
        
        if ([item isKindOfClass:[ClsRed class]])
            return @"RedCellIdentifier";
        else
            return @"BlueCellIdentifier";
        
        return @"";
        
    } configureCellBlock:^(id cell, id item, NSIndexPath *indexPath) {
        
        if ([item isKindOfClass:[ClsRed class]])
        {
            HDRedCell *objRedCell = (HDRedCell*)cell;
            [objRedCell configureCell:item];
        }
        else
        {
            HDBlueCell *objBlueCell = (HDBlueCell*)cell;
            [objBlueCell configureCell:item];
        }
    }];
    _tblItems.dataSource= _objTableDataSource;

}

#pragma mark - Other Methods

-(void)addStaticData
{
    ClsRed *objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit";
    objRed.intPoint = 100;
    [_arrItems addObject:objRed];
    
    ClsBlue *objBlue = [[ClsBlue alloc] init];
    objBlue.strTitle = @"Title1";
    [_arrItems addObject:objBlue];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit1";
    objRed.intPoint = 10;
    [_arrItems addObject:objRed];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit2222";
    objRed.intPoint = 20;
    [_arrItems addObject:objRed];
    
    objBlue = [[ClsBlue alloc] init];
    objBlue.strTitle = @"Title2";
    [_arrItems addObject:objBlue];
    
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit34";
    objRed.intPoint = 430;
    [_arrItems addObject:objRed];
    
    objBlue = [[ClsBlue alloc] init];
    objBlue.strTitle = @"Title3";
    [_arrItems addObject:objBlue];
    
    objRed = [[ClsRed alloc] init];
    objRed.strName = @"Harshit344";
    objRed.intPoint = 40;
    [_arrItems addObject:objRed];

}

@end
