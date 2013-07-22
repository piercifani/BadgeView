//
//  ViewController.m
//  BadgeViewDemo
//
//  Created by Pierluigi Cifani on 7/22/13.
//  Copyright (c) 2013 Pierluigi Cifani. All rights reserved.
//

#import "ViewController.h"
#import "SBBarButtonItem.h"

@interface ViewController ()
{
    NSInteger badgeValue;
}
@property (strong, nonatomic) SBBarButtonItem *barButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.barButton = [SBBarButtonItem buttonWithTarget:self action:@selector(onBarButtonTapped:) image:[UIImage imageNamed:@"bt-test"]];
    self.navigationItem.rightBarButtonItem = _barButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onBarButtonTapped:(id)sender
{
    
}

- (IBAction)onClearBadge:(id)sender
{
    badgeValue = 0;
    [self.barButton setBadgeValue:0];
}

- (IBAction)onPlusOneBadge:(id)sender
{
    badgeValue ++;
    [self.barButton setBadgeValue:badgeValue];
}

@end
