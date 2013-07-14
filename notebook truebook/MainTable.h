//
//  MainTable.h
//  notebook truebook
//
//  Created by xcode-004 on 13-1-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AddPage.h"
#import "Revse.h"
@interface MainTable : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *TableCodeView;
@property (strong, nonatomic) NSMutableArray *database;
@end
