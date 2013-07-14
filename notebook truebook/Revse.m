//
//  Revse.m
//  notebook truebook
//
//  Created by xcode-004 on 13-1-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Revse.h"
#define MV_LIST @"text"

@implementation Revse
@synthesize RevseL;
@synthesize datadase2=_datadase2;
@synthesize jishu=_jishu;
-(NSMutableArray *)datadase2
{
    if (_datadase2==nil)
    {
        NSUserDefaults *defau=[NSUserDefaults standardUserDefaults];
        _datadase2=[NSMutableArray arrayWithArray:[defau objectForKey:MV_LIST]];
        [defau setObject:self.datadase2 forKey:MV_LIST];
        [defau synchronize];
    }
    return _datadase2;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   [self.RevseL setText: [NSString stringWithFormat:@"%@",[self.datadase2 objectAtIndex:self.jishu ]]];
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"ok" style:UIBarButtonItemStylePlain target:self action:@selector(remove:)];
    // Do any additional setup after loading the view from its nib.
}
-(void)remove:(id)sender
{
    NSUserDefaults *defa2=[NSUserDefaults standardUserDefaults];
    NSMutableArray *array=[NSMutableArray arrayWithArray:[defa2 objectForKey:MV_LIST]];
    [array replaceObjectAtIndex:self.jishu withObject:self.RevseL.text];//
    [defa2 setObject:array forKey:MV_LIST];
    [defa2 synchronize];
}
- (void)viewDidUnload
{
    [self setRevseL:nil];
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
    NSUserDefaults *defa2=[NSUserDefaults standardUserDefaults];
    NSMutableArray *array=[NSMutableArray arrayWithArray:[defa2 objectForKey:MV_LIST]];
    [array addObject:self.RevseL.text];
    [defa2 setObject:array forKey:MV_LIST];
    [defa2 synchronize];
}
@end
