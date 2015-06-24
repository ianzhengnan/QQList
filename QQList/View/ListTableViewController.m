//
//  ListTableViewController.m
//  QQList
//
//  Created by zhengna on 15/6/23.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ListTableViewController.h"
#import "GroupModel.h"
#import "FriendsModel.h"
#import "HeaderView.h"
#import "ViewController.h"

@interface ListTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ListTableViewController

//lazy load
- (NSArray *)dataArray{
    if(!_dataArray){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dict in array) {
            GroupModel *groupModel = [GroupModel groupwithDict:dict];
            [muArray addObject:groupModel];
        }
        _dataArray = [muArray copy];
    }
    return _dataArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionHeaderHeight = 40;
    
    [self clipExtraCellLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    GroupModel *groupModel = self.dataArray[section];
    NSInteger count = groupModel.isOpen ? groupModel.friends.count : 0;
    
    return count;
}

// create cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //为了解决单元格复用的问题，使用标示符
    static NSString *identifier = @"friendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    GroupModel *groupModel = self.dataArray[indexPath.section];
    FriendsModel *friendModel = groupModel.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:friendModel.icon];
    cell.textLabel.text = friendModel.name;
    cell.detailTextLabel.text = friendModel.intro;
    
    return cell;
}

#pragma mark - UITableview delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    HeaderView *header = [HeaderView headerView:tableView];
    header.delegate = self;
    header.groupModel = self.dataArray[section];
    return header;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewController *viewCtrl = [[ViewController alloc] init];
    viewCtrl.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:viewCtrl animated:NO];
    
}


- (void)clickView{
    [self.tableView reloadData];
}

#pragma mark - remove useless lines

- (void)clipExtraCellLine:(UITableView *)tableView{

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
