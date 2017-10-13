//
//  SJViewController.m
//  SJProgressHUD
//
//  Created by superzhaolong@126.com on 10/12/2017.
//  Copyright (c) 2017 superzhaolong@126.com. All rights reserved.
//

#import "SJViewController.h"
#import <SJProgressHUD/SJProgressHUD.h>


@interface SJViewController ()
- (IBAction)onClickBtn;

@end

@implementation SJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickBtn {
    NSArray *images = @[
                        [UIImage imageNamed:@"sdp_loading1"],
                        [UIImage imageNamed:@"sdp_loading2"],
                        [UIImage imageNamed:@"sdp_loading3"]
                        ];
    [[SJProgressHUD sharedWithImages:images] show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[SJProgressHUD sharedWithImages:images] hide];
    });
}
@end
