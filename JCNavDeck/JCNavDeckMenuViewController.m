//
//  JCNavDeckMenuViewController.m
//  JCNavDeckDemo
//
//  Created by Jesse Collis on 7/10/13.
//  Copyright (c) 2013 JC Multimedia Design Pty Ltd. All rights reserved.
//

#import "JCNavDeckMenuViewController.h"
#import "JCNavDeckController.h"

static NSString * const kMenuCellReuseIdentifier = @"kMenuCellReuseIdentifier";

@interface JCNavDeckMenuViewController ()
@end

@implementation JCNavDeckMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMenuCellReuseIdentifier];

    [self.tableView reloadData];
}

- (void)setSelectedIndex:(NSUInteger)index
{
    NSParameterAssert([self isViewLoaded]); //This will crash the app if the view is not loaded. By design this should not get called prior to the view loading.

    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)[self.navDeckController.viewControllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMenuCellReuseIdentifier forIndexPath:indexPath];

    //Fetch the particular controller in the nav deck controller's 
    UIViewController *controller = self.navDeckController.viewControllers[indexPath.row];
    JCNavDeckItem *navDeckItem = controller.navDeckItem;

    cell.textLabel.text = navDeckItem.title;

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navDeckController setSelectedIndex:indexPath.row];
}

@end
