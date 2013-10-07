//
//  OneViewController.m
//  JCNavDeckDemo
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import "OneViewController.h"
#import "JCNavDeckController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"View Controller One";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //FIXME: JC - this is a bit of a hack to get started
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Nav" style:UIBarButtonItemStyleBordered target:self.navDeckController action:@selector(toggle)];

    self.view.backgroundColor = [UIColor redColor];
}

@end
