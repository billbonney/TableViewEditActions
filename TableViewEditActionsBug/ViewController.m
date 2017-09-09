//
//  ViewController.m
//  TableViewEditActionsBug
//
//  Created by Bill Bonney on 9/8/17.
//  Copyright © 2017 Communis Tech Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray* data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = @[@"Thing 1", @"Thing 2", @"Thing 3", @"Thing 4", @"Thing 5", @"Thing 6"];

}

-(void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Enable 'Delete' edit Action for odd cells
    return (indexPath.row % 2)? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath {
    return YES;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                            title:NSLocalizedString(@"Delete",@"")
                                                                          handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                              NSLog(@"Delete Me");
                                                                          }];
    return @[deleteAction];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    cell.textLabel.text = _data[indexPath.row];
    return cell;
    
}


@end
