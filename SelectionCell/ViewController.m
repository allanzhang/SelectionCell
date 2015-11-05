//
//  ViewController.m
//  SelectionCell
//
//  Created by Allan on 15/11/5.
//  Copyright © 2015年 Allan. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *table;
    NSMutableArray *dataArray;
    NSInteger lastSelectedIndex;
}

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    dataArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        Person *person = [[Person alloc] init];
        person.userId = i;
        person.userName = [NSString stringWithFormat:@"item %d", i];
        [dataArray addObject:person];
    }
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.tintColor = [UIColor redColor];
    table.backgroundColor = [UIColor lightGrayColor];
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 50;
    [self.view addSubview:table];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    Person *person = dataArray[indexPath.row];
    cell.textLabel.text = person.userName;
    cell.textLabel.textColor = [UIColor blackColor];
    if (person.isSelected) {
        cell.textLabel.text = @"我选中了";
        cell.textLabel.textColor = [UIColor redColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (lastSelectedIndex != indexPath.row) {
        Person *person = dataArray[lastSelectedIndex];
        person.isSelected = NO;
        NSIndexPath *lastSelectedIndexPath = [NSIndexPath indexPathForRow:lastSelectedIndex inSection:0];
        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:lastSelectedIndexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    }
    
    lastSelectedIndex = indexPath.row;
    Person *person = dataArray[indexPath.row];
    person.isSelected = YES;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

@end
