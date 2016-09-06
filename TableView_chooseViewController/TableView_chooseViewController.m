
//
//  TableView_chooseViewController.m
//  TableView_chooseViewController
//
//  Created by simon on 16/9/6.
//  Copyright © 2016年 simon. All rights reserved.
//

#import "TableView_chooseViewController.h"
#import "TableViewCell.h"

@interface TableView_chooseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSMutableArray *listArray;
@property (nonatomic,strong) NSMutableArray *selectedArray;//选中项所用数组
@property (nonatomic,assign) UITableViewCellEditingStyle  editingStyle;//用于区分tableview的多选 单选 及滑动删除操作
@end

@implementation TableView_chooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.listArray addObjectsFromArray:@[@"张三",@"李四",@"王二",@"麻子"]];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if ([self.type isEqualToString:@"multiple"]) {
        self.title = @"多选";
        self.editingStyle = UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
        self.tableview.allowsMultipleSelection = YES;
        
         //定义右上角按钮
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(okButton)];
        self.navigationItem.rightBarButtonItem = button;
    }else if ([self.type isEqualToString:@"single"]) {
         self.title = @"单选";
        self.editingStyle = UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
        self.tableview.allowsSelection = YES;
        
         //定义右上角按钮
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(okButton)];
        self.navigationItem.rightBarButtonItem = button;
    }else {
         self.title = @"滑动删除";
        self.editingStyle = UITableViewCellEditingStyleDelete ;
    }
    // Do any additional setup after loading the view.
}
-(void)okButton{
    NSString *muS = @"";
    for (NSString *str in self.selectedArray) {
        muS = [muS stringByAppendingFormat:@"%@ ",str];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"你选择了 %@",muS] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark --UITableView delegate datasoure

//返回section的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//返回cell的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
//加载TableViewCell,布局cell中的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil] firstObject];
    }
    cell.type = self.type;
    cell.nameLabel.text = self.listArray[indexPath.row];
    return cell;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.listArray.count) {
        return UITableViewCellEditingStyleInsert;
    }else{
        return self.editingStyle;
    }
}
//tableView点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = [self.listArray objectAtIndex:indexPath.row];
    if ([self.type isEqualToString:@"multiple"]) {
        [self.selectedArray addObject:string];
    }else if ([self.type isEqualToString:@"single"]) {
        [self.selectedArray addObject:string];
    }else{
    }
}
//取消tableView选中 点击事件
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *string = [self.listArray objectAtIndex:indexPath.row];
    NSArray *array = [self.selectedArray mutableCopy];
    if ([self.type isEqualToString:@"multiple"]) {
        for (NSString *str in array) {
            if ([string isEqualToString:str]) {
                [self.selectedArray removeObject:string];
            }
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }else if ([self.type isEqualToString:@"single"]){
        [self.selectedArray removeObject:string];
    }else{
    }
}

//删除按钮的title赋值
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
//删除用到的函数
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        if (self.listArray.count > 0) {
            [self.listArray removeObjectAtIndex:indexPath.row];
            [_tableview reloadData];
        }
    }
}
-(NSMutableArray *)selectedArray{
    if(!_selectedArray){
        _selectedArray = [NSMutableArray array];
    }
    return _selectedArray;
}
-(NSMutableArray *)listArray{
    if(!_listArray){
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
