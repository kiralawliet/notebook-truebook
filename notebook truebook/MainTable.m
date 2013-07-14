//
//  MainTable.m
//  notebook truebook
//
//  Created by xcode-004 on 13-1-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainTable.h"
#define MV_LIST @"text"
@implementation MainTable
@synthesize TableCodeView;
@synthesize database=_database;
//delegate
-(NSMutableArray *)database
{
    if (_database==nil)
    {
        NSUserDefaults *defau=[NSUserDefaults standardUserDefaults];
        _database=[NSMutableArray arrayWithArray:[defau objectForKey:MV_LIST]];
        [defau setObject:self.database forKey:MV_LIST];
        [defau synchronize];
    }
    return _database;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.database count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELLID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CELLID];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELLID];
    }
    [cell.textLabel setText:[self.database objectAtIndex:indexPath.row]];
    return cell;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)viewWillAppear:(BOOL)animated
{
    
    self.database=nil;
    [self.TableCodeView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(gotoFlipViewController:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"edit" style:UIBarButtonItemStylePlain target:self action:@selector(editTouched:)];
    
    [self.TableCodeView setDataSource:self];
    [self.TableCodeView setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}
-(void)gotoFlipViewController:(id)sender{
    AddPage *flip = [[AddPage alloc]initWithNibName:@"AddPage" bundle:nil];
    [self.navigationController pushViewController:flip animated:YES];
}
- (IBAction)editTouched:(UIBarButtonItem *)sender
{
    
    if ([self.TableCodeView isEditing])
    {
        [self.TableCodeView setEditing:NO animated:YES];
        [sender setTitle:@"Edit"];
        [sender setStyle:UIBarButtonItemStyleBordered];
        [self database];
    }
    else
    {
        [self.TableCodeView setEditing:YES animated:YES];
        [sender setTitle:@"Done"];
        [sender setStyle:UIBarButtonItemStyleDone];
    }
    //    NSArray *rowArr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    //    [self.TableCodeView reloadRowsAtIndexPaths:rowArr withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSUserDefaults *defa=[NSUserDefaults standardUserDefaults];
        // 从datasoucre里将内容删除
        [self.database removeObjectAtIndex:indexPath.row];
        
        //从cell的view删除单元格 updates的过程
        [tableView beginUpdates];
        NSArray *deletArry = [NSArray arrayWithObjects:indexPath, nil];
        [tableView deleteRowsAtIndexPaths:deletArry withRowAnimation:UITableViewRowAnimationRight];
        [tableView endUpdates];
        [defa setObject:self.database forKey:MV_LIST];
        [defa synchronize];
        
    }
    
    [self TableCodeView];
    
}

- (void)viewDidUnload
{
    [self setTableCodeView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Revse *flip = [[Revse alloc]initWithNibName:@"Revse" bundle:nil];
    flip.jishu = indexPath.row;
    [self.navigationController pushViewController:flip animated:YES];
}
@end
