//
//  ViewController.m
//  notebook truebook
//
//  Created by xcode-004 on 13-1-8.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)GoNextTouched:(id)sender
{
    MainTable *flip = [[MainTable alloc]initWithNibName:@"MainTable" bundle:nil];
    [self.navigationController pushViewController:flip animated:YES];
}
@end
