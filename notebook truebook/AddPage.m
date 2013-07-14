//
//  AddPage.m
//  notebook truebook
//
//  Created by xcode-004 on 13-1-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "AddPage.h"
#define MV_LIST @"text"
@implementation AddPage
@synthesize shurukuang;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
 
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"ok" style:UIBarButtonItemStylePlain target:self action:@selector(gotoFlipViewController:)];
  

    // Do any additional setup after loading the view from its nib.
}
-(void)gotoFlipViewController:(id)sender
{
    
    //保存内容
    NSUserDefaults *defa2=[NSUserDefaults standardUserDefaults];
    NSMutableArray *array=[NSMutableArray arrayWithArray:[defa2 objectForKey:MV_LIST]];
    [array addObject:self.shurukuang.text];
    [defa2 setObject:array forKey:MV_LIST];
    [defa2 synchronize];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"记录完成"
 message:@"完成" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
    [alertView show];

}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         






- (void)viewDidUnload
{
    [self setShurukuang:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)DoneTouched:(id)sender 
{
    MainTable   *flip = [[MainTable alloc]initWithNibName:@"MainTable" bundle:nil];
    [self.navigationController pushViewController:flip animated:YES];
}
@end
