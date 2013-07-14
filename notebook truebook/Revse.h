//
//  Revse.h
//  notebook truebook
//
//  Created by xcode-004 on 13-1-9.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Revse : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *RevseL;
- (IBAction)DoneTouched:(id)sender;
@property (strong,nonatomic) NSMutableArray *datadase2;
@property (assign,nonatomic) NSInteger jishu;

@end
